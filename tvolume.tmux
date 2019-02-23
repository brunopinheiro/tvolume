#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${CURRENT_DIR}/scripts/helpers.sh"

do_interpolation() {
  local input="$1"
  local original="\#{volume_percentage}"
  local replacement="#(${CURRENT_DIR/scripts/get_volume_percentage.sh})"
  local interpolation="${input/${original}/${replacement}}"
  echo "$interpolation"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main

unset CURRENT_DIR
