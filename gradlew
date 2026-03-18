#!/bin/sh
set -e
GRADLE_VERSION="8.0"
GRADLE_URL="https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
GRADLE_HOME="${HOME}/.gradle/wrapper/dists/gradle-${GRADLE_VERSION}-bin"

if [ ! -f "${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle" ]; then
    mkdir -p "${GRADLE_HOME}"
    curl -L "${GRADLE_URL}" -o "${GRADLE_HOME}/gradle.zip"
    unzip -q "${GRADLE_HOME}/gradle.zip" -d "${GRADLE_HOME}"
fi

exec "${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin/gradle" "$@"
