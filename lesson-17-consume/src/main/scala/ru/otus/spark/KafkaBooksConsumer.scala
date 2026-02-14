package ru.otus.spark

import org.apache.log4j.{Level, Logger}
import org.apache.spark._
import org.apache.spark.sql._
import org.apache.spark.sql.types.{IntegerType, DoubleType, StringType, StructField, StructType}
import org.apache.spark.sql.functions._
import org.apache.spark.sql.streaming.Trigger

object KafkaBooksConsumer {
  def main(args: Array[String]): Unit = { 

      val spark = SparkSession
                  .builder()
                  .appName("KafkaConsumer")
                  .getOrCreate()

      spark.sparkContext.setLogLevel("WARN")
      import spark.implicits._

      val schema = StructType(List(
      StructField("Name", StringType, nullable = true),
      StructField("Author", StringType, nullable = true),
      StructField("UserRating", DoubleType, nullable = true),
      StructField("Reviews", IntegerType, nullable = true),
      StructField("Price", DoubleType, nullable = true),
      StructField("Year", IntegerType, nullable = true),
      StructField("Genre", StringType, nullable = true)
      ))

      val kafkaBootstrap = "kafka:9092"
      val topic = "books"

      val rawKafka = spark.readStream
        .format("kafka")
        .option("kafka.bootstrap.servers", kafkaBootstrap)
        .option("subscribe", topic)
        .option("startingOffsets", "earliest")
        .load()

      val parsed = rawKafka
        .selectExpr("CAST(value AS STRING) as json")
        .select(from_json(col("json"), schema).as("data"))
        .select("data.*")

      val filtered = parsed.filter(col("UserRating") >= 4.0)

      // val consoleQuery = filtered.writeStream
      //   .format("console")
      //   .option("truncate", false)
      //   .trigger(Trigger.ProcessingTime("5 seconds"))
      //   .start()

      val parquetQuery = filtered.writeStream
  //     .foreachBatch { (batchDF, batchId) =>
  //   println(s"Batch $batchId: ${batchDF.count()} records")
  // }
        .format("parquet")
        .option("path", "/opt/spark-data/books_parquet")
        .option("checkpointLocation", "/opt/spark-data/checkpoint/consumer")
        .outputMode("append")
        .trigger(Trigger.ProcessingTime("5 seconds"))
        .start()
        
      // consoleQuery.awaitTermination()
      parquetQuery.awaitTermination()
    }
}