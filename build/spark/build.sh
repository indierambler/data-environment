# Build script for spark stack docker images
set -eo pipefail  # exit script if any command errors
cd "$(dirname "$0")"/../..  # change PWD to docker project root
source .env  # load variables from .env file

# build images
docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f build/spark/base/Dockerfile \
  -t spark-base . \
  --no-cache

# *****Following builds are for the final images*****
# uncomment them if bulding from the compose yaml causes problems
#docker build \
#  -f build/spark/master/Dockerfile \
#  -t spark-master . \
#  --no-cache

#docker build \
#  -f build/spark-worker/Dockerfile \
#  -t spark-worker . \
#  --no-cache

