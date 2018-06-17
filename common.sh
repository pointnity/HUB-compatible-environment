#!/bin/bash

RUN_FROM=`dirname "$0"`
FB_ROOT_REL="${0%/*}"
FB_ROOT=`cd "${FB_ROOT_REL}"; pwd`
BUILDDIR=""
PROJDIR=""
USED_ARGS=0

function print_usage()
{
    echo "usage: $0 [<project dir> [<build dir>]] [<params ...>]"
}

function check_proj_dir()
{
