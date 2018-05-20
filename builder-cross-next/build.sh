#!/bin/bash

source /build_environment.sh $1

# Grab the last segment from the package name
name=${pkgName##*/}

mainPackagePath=$1
if [[ ! -z "${mainPackagePath}" ]];
then
  cd ${mainPackagePath}
fi

BUILD_GOOS=${BUILD_GOOS:-"darwin linux windows"}
BUILD_GOARCH=${BUILD_GOARCH:-"386 amd64 arm"}

for goos in $BUILD_GOOS; do
        for goarch in $BUILD_GOARCH; do
                echo "Building $name for $goos-$goarch"
                # Why am I redefining the same variables that already existed?
                # Somehow they're not available just from the loop, unless I
                # either export them or do this. My theory is that it's somehow
                # building in another process that doesn't have access to the
                # loop variables. That caused everything to be built for linux.
                `GOOS=$goos GOARCH=$goarch CGO_ENABLED=${CGO_ENABLED:-0} go build \
                        -a \
                        -o $name-$goos-$goarch \
                        --installsuffix cgo \
                        --ldflags="${LDFLAGS:--s}"`
                rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
        done
done
