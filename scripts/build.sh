#!/bin/bash

BUILD_CMD="mvn package"

if [ "${GIT_TAG}" ]
then
  RELEASE_VERSION=${GIT_TAG}
	echo "Detected tagged build version ${GIT_TAG}. Setting version to ${RELEASE_VERSION}"
	mvn versions:set -DnewVersion=${GIT_TAG}
else
	echo "No tag detected on the current commit. This is a non-release build."
fi

echo "Executing build as: ${BUILD_CMD}"
exit=0
eval "${BUILD_CMD}" || exit=$?
exit $exit
