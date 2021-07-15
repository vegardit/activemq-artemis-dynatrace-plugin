#!/usr/bin/env bash
#
# Copyright 2021 by Vegard IT GmbH, Germany, https://vegardit.com
# SPDX-License-Identifier: Apache-2.0
#
# Author: Sebastian Thomschke, Vegard IT GmbH
#
# https://github.com/vegardit/activemq-artemis-dynatrace-plugin
#

set -eu

#################################################
# execute script with bash if loaded with other shell interpreter
#################################################
if [ -z "${BASH_VERSINFO:-}" ]; then /usr/bin/env bash "$0" "$@"; exit; fi

set -o pipefail


#################################################
# install debug traps
#################################################
trap 'echo >&2 "$(date +%H:%M:%S) Error - exited with status $? at line $LINENO:"; pr -tn $0 | tail -n+$((LINENO - 3)) | head -n7' ERR

if [[ "${DEBUG:-}" == "1" ]]; then
  if [[ $- =~ x ]]; then
    # "set -x" was specified already, we only improve the PS4 in this case
    PS4='+\033[90m[$?] $BASH_SOURCE:$LINENO ${FUNCNAME[0]}()\033[0m '
  else
    # "set -x" was not specified, we use a DEBUG trap for better debug output
    set -T

    __print_debug_statement() {
      printf "\e[90m#[$?] $BASH_SOURCE:$1 ${FUNCNAME[1]}() %*s\e[35m$BASH_COMMAND\e[m\n" "$(( 2 * ($BASH_SUBSHELL + ${#FUNCNAME[*]} - 2) ))" >&2
    }
    trap '__print_debug_statement $LINENO' DEBUG
  fi
fi


#################################################
# check prereqs
#################################################
if ! hash "git" &>/dev/null; then
  echo "Error: command 'git' not found."
  exit 1
fi

if ! hash "zip" &>/dev/null; then
  echo "Error: command 'zip' not found."
  exit 1
fi

if ! hash "yq" &>/dev/null; then
  echo "Error: command 'yq' not found. Please install from https://github.com/mikefarah/yq/releases/"
  exit 1
fi


#################################################
# build
#################################################
project_root=$(realpath $(dirname "$BASH_SOURCE[0]"))
echo "project_root=$project_root"

work_dir=$project_root/work
echo "work_dir=$work_dir"

# use last commit time unix epoch value as minor version
minor_version=$(git show -s --format=%ct)

#rm -rf "$work_dir"

for f in $project_root/*/plugin.yaml; do

  plugin_name=$(basename $(dirname $f))

  if [[ ${GITHUB_ACTIONS:-} == "true" ]]; then echo "::group::Processing [$plugin_name]..."; fi

  if [[ $OSTYPE == "cygwin" || $OSTYPE == "msys" ]]; then
    f=$(cygpath -w "$f")
  fi

  echo "Validating [$f]..."
  yq e "$f">/dev/null

  mkdir -p "$work_dir/$plugin_name/custom"

  # suffix the version with the commit SHA
  yq -j e ".version |= sub(\"-SNAPSHOT\", \"\") + \".$minor_version\"" $f >$work_dir/$plugin_name/custom/plugin.json

  plugin_zip=$work_dir/$plugin_name-latest.zip
  echo "Creating [$plugin_zip]..."
  (cd $work_dir/$plugin_name && zip -r "$plugin_zip" ./custom/*)

  if [[ ${GITHUB_ACTIONS:-} == "true" ]]; then echo "::endgroup::"; fi
done
