#!/usr/bin/env sh

set -x

dotnet restore

echo "Restore Completed Successfully ... for Build Id ${BUILD_ID}"

dotnet build

echo "Build successfully Completed... for Build Id ${BUILD_ID}"

set +x
