package ru.otus.spark

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.BeforeAndAfter
import com.github.mrpowers.spark.fast.tests.DataFrameComparer
import ru.otus.spark.SparkTestSession

import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions._

class CountriesLanguageRankingFunctionalTest
    extends AnyFlatSpec
    with SparkTestSession
    with BeforeAndAfter
    with DataFrameComparer {

  var inputDf: DataFrame = _

  before {
    import spark.implicits._

    inputDf = Seq(
      ("Russia", "Russian", null),
      ("USA", "English", null),
      ("Canada", "English", "French")
    ).toDF("name", "en", "fr")
      .select(
        struct($"name".as("common")).as("name"),
        struct(
          $"en",
          $"fr"
        ).as("languages")
      )
  }

  it should "aggregate languages correctly" in {

    import spark.implicits._

    val actual =
      DataframeApp.getLanguageRanking(inputDf)

    val expected = Seq(
      ("English", 2L, Seq("USA", "Canada")),
      ("Russian", 1L, Seq("Russia")),
      ("French", 1L, Seq("Canada"))
    ).toDF("Language", "NumCountries", "Countries")

    assertSmallDataFrameEquality(
      actual,
      expected,
      ignoreNullable = true,
      orderedComparison = false
    )
  }
}