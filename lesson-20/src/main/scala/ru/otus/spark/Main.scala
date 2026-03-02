package ru.otus.spark

import org.apache.log4j.{Level, Logger}
import org.apache.spark._
import org.apache.spark.sql._
import org.apache.spark.sql.types.{IntegerType, DoubleType, StringType, StructField, StructType}
import org.apache.spark.sql.functions._

import org.apache.spark.ml.Pipeline
import org.apache.spark.ml.feature.{StringIndexer, VectorAssembler}
import org.apache.spark.ml.classification.LogisticRegression
import org.apache.spark.ml.evaluation.MulticlassClassificationEvaluator

object Main {
  def main(args: Array[String]): Unit = { 

    val spark = SparkSession
                    .builder()
                    .appName("ml spark")
                    .getOrCreate()

      spark.sparkContext.setLogLevel("WARN")
      import spark.implicits._

       val schema = StructType(Array(
      StructField("sepal_length", DoubleType, nullable = false),
      StructField("sepal_width", DoubleType, nullable = false),
      StructField("petal_length", DoubleType, nullable = false),
      StructField("petal_width", DoubleType, nullable = false),
      StructField("species", StringType, nullable = false)
      ))

      val inputPath = "/opt/spark-data/input/IRIS.csv"
      val kafkaBootstrap = "kafka:9092"
      val topic = "books"

      val df = spark.read
      .option("header", "true")
      .schema(schema)
      .csv(inputPath)

    val labelIndexer = new StringIndexer()
      .setInputCol("species")
      .setOutputCol("label")

    val assembler = new VectorAssembler()
      .setInputCols(Array(
        "sepal_length",
        "sepal_width",
        "petal_length",
        "petal_width"
      ))
      .setOutputCol("features")

    val lr = new LogisticRegression()
      .setFeaturesCol("features")
      .setLabelCol("label")
      .setMaxIter(50)

    val pipeline = new Pipeline()
      .setStages(Array(labelIndexer, assembler, lr))

    val Array(train, test) = df.randomSplit(Array(0.8, 0.2), seed = 42)

    val model = pipeline.fit(train)

    val predictions = model.transform(test)

    predictions.select("species", "prediction", "probability").show(5, false)

    val evaluator = new MulticlassClassificationEvaluator()
      .setLabelCol("label")
      .setPredictionCol("prediction")
      .setMetricName("accuracy")

    val accuracy = evaluator.evaluate(predictions)

    println(s"Accuracy = $accuracy")

    val f1 = evaluator.setMetricName("f1").evaluate(predictions)
    println(s"F1-score = $f1")

    val modelPath = "/opt/spark-data/models/iris-model"

    model.write.overwrite().save(modelPath)
    }
}