#!/bin/bash

set -euo pipefail

publisher_jar="publisher.jar"
input_cache_path="$(pwd)/input-cache"
upper_path=".."

find_publisher() {
  if [ -f "$input_cache_path/$publisher_jar" ]; then
    echo "$input_cache_path/$publisher_jar"
    return 0
  fi

  if [ -f "$upper_path/$publisher_jar" ]; then
    echo "$upper_path/$publisher_jar"
    return 0
  fi

  return 1
}

jar_location="$(find_publisher || true)"
if [ -z "$jar_location" ]; then
  echo "IG Publisher NOT FOUND in input-cache or parent folder. Run ./_updatePublisher.sh first."
  exit 1
fi

request_file="publication-request.json"
request_backup="${request_file}.fast-local.bak"
restore_request=false
ignore_file="input/ignoreWarnings.txt"
ignore_fast_file="input/ignoreWarnings-fast-local.txt"
ignore_backup="${ignore_file}.fast-local.bak"
restore_ignore=false

# The publication request triggers previous-version comparison, which is slow for local iteration.
if [ -f "$request_file" ]; then
  mv "$request_file" "$request_backup"
  restore_request=true
fi

# Fast local builds can use a broader ignore list for known terminology-related QA noise.
if [ -f "$ignore_fast_file" ] && [ -f "$ignore_file" ]; then
  cp "$ignore_file" "$ignore_backup"
  cp "$ignore_fast_file" "$ignore_file"
  restore_ignore=true
fi

cleanup() {
  if [ "$restore_request" = true ] && [ -f "$request_backup" ]; then
    mv "$request_backup" "$request_file"
  fi
  if [ "$restore_ignore" = true ] && [ -f "$ignore_backup" ]; then
    mv "$ignore_backup" "$ignore_file"
  fi
}
trap cleanup EXIT

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

tx_mode="notx"
if [ $# -gt 0 ]; then
  case "$1" in
    tx|--tx)
      tx_mode="tx"
      shift
      ;;
    notx|--notx)
      shift
      ;;
  esac
fi

if [ "$tx_mode" = "tx" ]; then
  echo "Running fast local build (with tx, skip previous-version comparison)"
  java ${JAVA_OPTS:-} -jar "$jar_location" -ig . "$@"
else
  echo "Running fast local build (no tx, no network, skip previous-version comparison)"
  java ${JAVA_OPTS:-} -jar "$jar_location" -ig . -tx n/a -no-network "$@"
fi
