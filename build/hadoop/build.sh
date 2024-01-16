# Build script for hadoop stack docker images
set -eo pipefail  # exit script if any command errors
cd "$(dirname "$0")"/../..  # change PWD to docker project root
source .env  # load variables from .env file

# build images
docker build \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg base_dir=build/hadoop/base \
  --build-arg namenode_dir=build/hadoop/namenode \
  --build-arg datanode_dir=build/hadoop/datanode \
  --build-arg resourcemanager_dir=build/hadoop/resourcemanager \
  --build-arg nodemanager_dir=build/hadoop/nodemanager \
  --build-arg historyserver_dir=build/hadoop/historyserver \
  -f build/hadoop/base/Dockerfile \
  -t hadoop-base . \
  --no-cache

