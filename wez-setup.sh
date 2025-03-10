#!/usr/bin/bash

# default to home
dir="~"
if [ -z "$1" ]; then
    dir="$1"
fi

# open lazygit and nvim if in git repo
if git rev-parse --git-dir > /dev/null 2>&1; then
    wezterm cli spawn --cwd="$1" lazygit
    wezterm cli spawn --cwd="$1" nvim .
fi

wezterm cli spawn --cwd="$1"
