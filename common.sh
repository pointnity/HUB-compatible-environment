#!/bin/bash

RUN_FROM=`dirname "$0"`
FB_ROOT_REL="${0%/*}"
FB_ROOT=`cd "${FB_ROOT_REL}"; pwd`
BUILDDIR=""
