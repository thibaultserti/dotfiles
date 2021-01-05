#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

cleanup() {
    trap - SIGINT SIGTERM ERR EXIT
    # script cleanup here
}

function usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-o] [-l]

Script description here.

Available options:

-h, --help      Print this help and exit
-v, --verbose   Print script debug info
-o, --os        Set the distribution
-l, --level     Set the package level (1 stands for very usefull utilities, 2 for extras,
                3 for programming language, 4 for big software, 5 for devops tools, 6 for hacking)
EOF
    exit
}

setup_colors() {
    if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        # shellcheck disable=SC2034
        NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
    else
        # shellcheck disable=SC2034
        NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
    fi
}

msg() {
    echo >&2 -e "${1-}"
}

die() {
    local msg=$1
    local code=${2-1} # default exit status 1
    msg "$msg"
    exit "$code"
}

parse_params() {
    while :; do
        #PARAM=$(echo "$1" | awk -F= '{print $1}')
        #VALUE=$(echo "$1" | awk -F= '{print $2}')
        case "${1-}" in
        -h | --help) usage ;;
        -v | --verbose) set -x ;;
        --no-color) NO_COLOR=1 ;;
        -o | --os)
            OS="${2-}"
            shift
            ;;
        -l | --level)
            LEVEL="${2-}"
            shift
            ;;
        -?*) die "Unkwnown option : $1" ;;
        *) break ;;
        esac
        shift
    done

    # check required params and arguments
    [[ -z "${OS-}" ]] && die "Missing required parameter: os"
    [[ -z "${LEVEL-}" ]] && die "Missing required parameter: level"

    return 0
}

parse_params "$@"
setup_colors

if [[ "$OS" = "debian" ]] || [[ "$OS" = "ubuntu" ]]; then
    COLUMN=3
elif [[ "$OS" = "manjaro" ]] || [[ "$OS" = "arch" ]]; then
    COLUMN=2
elif [[ "$OS" = "fedora" ]] || [[ "$OS" = "redhat" ]]; then
    COLUMN=4
else
    die "Unkwnown distribution"
fi

{ [[ "$LEVEL" -lt 1 ]] || [[ "$LEVEL" -gt 6 ]]; } && die "Unkwnown level"

RES=$(cut -d',' -f1,"$COLUMN" "$script_dir/packages.csv")
