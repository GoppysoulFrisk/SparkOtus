package ru.otus.spark

import com.github.mrpowers.spark.fast.tests.DataFrameComparer
import org.apache.spark.sql.SparkSession
import org.scalatest.funsuite.AnyFunSuite

trait SparkTestSession {
    lazy val spark: SparkSession =
    SparkSession.builder()
      .appName("test")
      .master("local[*]")
      .getOrCreate()
}
