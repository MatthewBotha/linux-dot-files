#!/usr/bin/env bash

function clean-nix() {
    nix-collect-garbage --delete-old
    sudo nix-collect-garbage -d
    # sudo /run/current-system/bin/switch-to-configuration boot
}

