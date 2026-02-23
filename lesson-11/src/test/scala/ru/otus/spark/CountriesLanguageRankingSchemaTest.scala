package ru.otus.spark

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.BeforeAndAfter
import ru.otus.spark.SparkTestSession

import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions._

class CountriesLanguageRankingSchemaTest
    extends AnyFlatSpec
    with SparkTestSession
    with BeforeAndAfter {

  var inputDf: DataFrame = _

  before {
    import spark.implicits._

    inputDf = Seq(
      ("Russia", "Russian")
    ).toDF("name", "ru")
      .select(
        struct($"name".as("common")).as("name"),
        struct($"ru").as("languages")
      )
  }

  it should "return expected schema" in {

    val result =
      DataframeApp.getLanguageRanking(inputDf)

    val expectedColumns =
      Seq("Language", "NumCountries", "Countries")

    assert(expectedColumns.forall(result.columns.contains))
  }
}