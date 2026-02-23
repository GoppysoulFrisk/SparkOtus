package ru.otus.spark

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.BeforeAndAfter
import ru.otus.spark.SparkTestSession
import org.apache.spark.sql.DataFrame
import org.apache.spark.sql.functions._

class CountriesWithBordersSchemaTest
    extends AnyFlatSpec
    with SparkTestSession
    with BeforeAndAfter {

  var inputDf: DataFrame = _

  before {
    import spark.implicits._

    inputDf = Seq(
      ("Russia", Seq("NOR", "FIN", "EST", "LVA", "LTU", "POL"))
    ).toDF("name", "borders")
      .select(
        struct($"name".as("common")).as("name"),
        $"borders"
      )
  }

  it should "return expected schema" in {

    val result = DataframeApp.getCountriesWithManyBorders(inputDf)

    val expectedColumns =
      Seq("Country", "NumBorders", "BorderCountries")

    assert(expectedColumns.forall(result.columns.contains))
  }
}