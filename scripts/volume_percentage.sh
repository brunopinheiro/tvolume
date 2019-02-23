#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${CURRENT_DIR}/scripts/helpers.sh"

is_muted() {
  [ $(osascript -e "output muted of (get volume settings)") == "true" ]
}

get_volume_percentage() {
  if is_osx; then
    if is_muted; then
      echo "muted"
    else
      echo "calculating"
    fi
  else
    echo "Not Available"
  fi
}

get_volume_percentage

unset CURRENT_DIR
