#!/bin/bash
. $(dirname $0)/commands.sh

usage="
$(basename "$0") [-t] [-g] [-h] -- program to build GUB (GStreamer Unity Bridge)

where:
    -t | --test    build android application for testing GUB
    -g | --gstAnd  use prebuilded libgstreamer_android.so
    -h | --help    show this help text
"

BUILD_TEST=false
COPY_GST_AND_LIB=false

show_help=false
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in

    -t|--test)    BUILD_TEST=true
                  ;;

    -g|--gstAnd)  COPY_GST_AND_LIB=true
                  ;;

    -h|--help)    show_help=true
                  ;;

    *)            echo "Unknown argument : " $key
                  show_help=true
                  ;;
  esac
  shift
done

if [ "$show_help" = true ]; then
  echo "$usage"
  exit
fi

copyRepo

if [ "$BUILD_TEST" = true ]; then
  buildTest
else
  buildGUB
fi