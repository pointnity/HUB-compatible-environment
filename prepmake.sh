#!/bin/bash

if [ "${GEN}" = "" ]; then
  GEN='Unix Makefiles'
fi

source ${0%/*}/common.sh "$@"
