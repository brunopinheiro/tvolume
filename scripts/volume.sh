#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

option_muted_text=""
option_missing_text=""

option_muted_text_default="⊘"
option_missing_text_default="⊗"

get_option_muted_text() {
  option_muted_text=$(get_tmux_option "@volume_muted_icon" "$option_muted_text_default")
}

get_option_missing_text() {
  option_missing_text=$(get_tmux_option "@volume_missing_icon" "$option_missing_text_default")
}

is_muted() {
  [ $(osascript -e "output muted of (get volume settings)") == "true" ]
}

get_volume_output() {
  local volume="$(osascript -e "output volume of (get volume settings)")"
  if [ "$volume" == "missing value" ]; then
    echo "$option_missing_text"
  else
    echo "$volume%"
  fi
}

get_volume_percentage() {
  if is_osx; then
    if is_muted; then
      get_option_muted_text
      echo "$option_muted_text"
    else
      get_option_missing_text
      echo "$(get_volume_output)"
    fi
  else
    echo "Not Available"
  fi
}

get_volume_percentage
