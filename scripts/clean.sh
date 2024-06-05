#!/usr/bin/env bash

function clean-nix() {
    # colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # no color
    
    nix-collect-garbage --delete-old
    sudo nix-collect-garbage -d
    # sudo /run/current-system/bin/switch-to-configuration boot
}

