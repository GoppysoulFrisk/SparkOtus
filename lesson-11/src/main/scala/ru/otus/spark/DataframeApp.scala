package ru.otus.spark

import org.apache.log4j.{Level, Logger}
import org.apache.spark._
import org.apache.spark.sql._
import org.apache.spark.sql.Column
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types.{IntegerType, DoubleType, StringType, StructField, StructType}

object DataframeApp {
  def main(args: Array[String]): Unit = { 

      val spark = SparkSession
                  .builder()
                  .appName("DataframeApp")
                  .getOrCreate()

      spark.sparkContext.setLogLevel("WARN")
      // import spark.implicits._

      val countriesDF = spark.read.option("multiline", "true").json("data/countries.json")
      val countriesManyBorders = getCountriesWithManyBorders(countriesDF)
      val languageRanking = getLanguageRanking(countriesDF)

      countriesManyBorders.coalesce(1).write.mode("overwrite").parquet("/opt/spark-data/countries_many_borders")
      languageRanking.coalesce(1).write.mode("overwrite").parquet("/opt/spark-data/language_ranking")
      spark.stop()

    }

    def getCountriesWithManyBorders(df: DataFrame, minBorders: Int = 5): DataFrame = {
    import df.sparkSession.implicits._

      df.withColumn("NumBorders", size($"borders"))
        .filter($"NumBorders" >= minBorders)
        .withColumn("BorderCountries", concat_ws(",", $"borders"))
        .select(
          $"name.common".as("Country"),
          $"NumBorders",
          $"BorderCountries"
        )
    }

    def getLanguageRanking(df: DataFrame): DataFrame = {
    import df.sparkSession.implicits._

      val languageCols = df.select("languages.*").columns

      val dfWithMap = df.withColumn(
        "languages_map",
        map(languageCols.flatMap(c => Seq(lit(c), col(s"languages.$c"))): _*)
      )

    val langExploded = dfWithMap
      .select(
        col("name.common").as("Country"),
        explode(col("languages_map")).as(Seq("lang_code", "Language"))
      )
      .filter(col("Language").isNotNull)

      langExploded
        .groupBy("Language")
        .agg(
          count("*").as("NumCountries"),
          collect_list("Country").as("Countries")
        )
        .orderBy(desc("NumCountries"))
    }
}