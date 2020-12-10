#!/usr/bin/bash

function usage() {
  echo "Usage"
}

while [ "$1" != "" ]; do
  PARAM=$(echo "$1" | awk -F= '{print $1}')
  VALUE=$(echo "$1" | awk -F= '{print $2}')
  case $PARAM in
  -h | --help)
    usage
    exit
    ;;
  --os)
    OS=$VALUE
    ;;
  *)
    echo "ERROR: unknown parameter \"$PARAM\""
    usage
    exit 1
    ;;
  esac
  shift
done

if [[ "$OS" = "debian" ]] || [[ "$OS" = "ubuntu" ]]; then
  echo "debian"
elif [[ "$OS" = "manjaro" ]] || [[ "$OS" = "arch" ]]; then
  echo "arch"
elif [[ "$OS" = "fedora" ]] || [[ "$OS" = "redhat" ]]; then
  echo "redhat"
else
  echo "unkwnown distribution"
fi
