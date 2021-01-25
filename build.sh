#!/bin/bash

docker build .
CID=$(docker create lib_mariadbudf_sys)
docker cp ${CID}:/build/lib_mysqludf_sys/lib_mariaudf_sys.so .
docker rm ${CID}
