#!/usr/bin/env bash

is_osx() {
  [ $(uname) == "Darwin" ]
}

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"
  [[ -n "$option_value" ]] && echo "$option_value" || echo "$default_value"
}
