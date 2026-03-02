docker exec -it master /opt/spark/bin/spark-submit \
  --master spark://spark-master:7077 \
  --conf spark.cores.max=1 \
  --executor-cores 1 \
  --num-executors 1 \
  --deploy-mode client \
  --class ru.otus.spark.Main \
/opt/spark-apps/sparkotusml_2.12-1.0.jar