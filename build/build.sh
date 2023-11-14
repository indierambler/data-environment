# Build scripts for ml stack docker images

# ml stack versions
SPARK_VERSION="3.4.0"
HADOOP_VERSION="3"
JUPYTERLAB_VERSION="4.0.0"

# build images
docker build \
  -f build/cluster-base/Dockerfile \
  -t cluster-base . \
  --no-cache

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f build/spark-base/Dockerfile \
  -t spark-base . \
  --no-cache

docker build \
  -f build/spark-master/Dockerfile \
  -t spark-master . \
  --no-cache

docker build \
  -f build/spark-worker/Dockerfile \
  -t spark-worker . \
  --no-cache

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f build/jupyterlab/Dockerfile \
  -t jupyterlab . \
  --no-cache
