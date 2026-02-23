package ru.otus.spark

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.BeforeAndAfter
import com.github.mrpowers.spark.fast.tests.DataFrameComparer
import ru.otus.spark.SparkTestSession
import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions._

class CountriesWithBordersFunctionalTest
    extends AnyFlatSpec
    with SparkTestSession
    with BeforeAndAfter
    with DataFrameComparer {

  var inputDf: DataFrame = _

  before {
    import spark.implicits._

    inputDf = Seq(
      ("Russia", Seq("NOR", "FIN", "EST", "LVA", "LTU", "POL")),
      ("Iceland", Seq())
    ).toDF("name", "borders")
      .select(
        struct($"name".as("common")).as("name"),
        $"borders"
      )
  }

  it should "return country with borders >= 5" in {

    import spark.implicits._

    val actual =
      DataframeApp.getCountriesWithManyBorders(inputDf, minBorders = 5)

    val expected = Seq(
      ("Russia", 6, "NOR,FIN,EST,LVA,LTU,POL")
    ).toDF("Country", "NumBorders", "BorderCountries")

    assertSmallDataFrameEquality(
      actual,
      expected,
      ignoreNullable = true
    )
  }
}