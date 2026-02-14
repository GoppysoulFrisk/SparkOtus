docker exec -it master /opt/spark/bin/spark-submit \
  --master spark://spark-master:7077 \
  --conf spark.cores.max=1 \
  --executor-cores 1 \
  --num-executors 1 \
  --deploy-mode client \
  --class ru.otus.spark.KafkaBooksConsumer \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.7 \
  /opt/spark-apps/sparkotusconsumer_2.12-1.0.jar