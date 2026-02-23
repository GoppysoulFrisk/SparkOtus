name := "otus-spark-lesson-11"

ThisBuild / organization := "ru.otus.spark"
ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.12"

lazy val sparkVersion = "3.5.7"
lazy val circeVersion = "0.14.9"

ThisBuild / libraryDependencies ++= Seq(
  "com.typesafe" % "config" % "1.4.2",
  "org.apache.spark" %% "spark-core"    % sparkVersion % "provided",
  "org.apache.spark" %% "spark-sql"     % sparkVersion % "provided",
  "org.scalatest" %% "scalatest" % "3.2.18" % Test,
  "com.github.mrpowers" %% "spark-fast-tests" % "1.3.0" % Test
)

Compile / mainClass := Some("ru.otus.spark.DataframeApp")

javaOptions += "-Dhadoop.security.authentication=none"