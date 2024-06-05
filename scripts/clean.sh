#!/usr/bin/env bash

function clean-nix() {
    # colors
    GREEN='\033[0;32m'
    NC='\033[0m' # no color
    
    echo -e "${GREEN}Deleting old...${NC}"
    nix-collect-garbage --delete-old
    
    echo -e "${GREEN}Deleting garbage...${NC}"
    sudo nix-collect-garbage -d
    # sudo /run/current-system/bin/switch-to-configuration boot
}

