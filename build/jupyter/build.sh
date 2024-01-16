# Build script for jupyter stack docker images
set -eo pipefail  # exit script if any command errors
cd "$(dirname "$0")"/../..  # change PWD to docker project root
source .env  # load variables from .env file

# build images
docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f build/jupyter/base/Dockerfile \
  -t jupyter-base . \
  --no-cache

# *****Following builds are for the final images*****
# uncomment them if bulding from the compose yaml causes problems
#docker build \
#  --build-arg spark_version="${SPARK_VERSION}" \
#  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
#  -f build/jupyter/lab/Dockerfile \
#  -t jupyterlab . \
#  --no-cache
