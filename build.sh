#!/bin/bash -ex
prefix="$1"
cmake="$2"
os="$3"
if [[ $os = "windows" ]]
then
  "$cmake" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX="$(cygpath $prefix)" \
    -DCMAKE_MAKE_PROGRAM=make \
    -GUnix\ Makefiles \
    -DCMAKE_HOST_WIN32=true \
    .
else
  "$cmake" \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX="$prefix" \
    .
fi