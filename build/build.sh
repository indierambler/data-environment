# Run build scripts for ml stack docker images
set -eo pipefail  # exit script if any command errors
cd "$(dirname "$0")"/..  # change PWD to docker project root
source .env  # load variables from .env file

# run per-service image builder scripts
./build/hadoop/build.sh
./build/spark/build.sh
./build/jupyter/build.sh

