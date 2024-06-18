#!/usr/bin/env bash

function rebuild-nix() {
    # colors
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # no color

    # check if flake path is set
    if [ -z ${FLAKE_CONFIG_DIR+x} ]; then
        echo -e "${RED}Flake config directory is not set${NC}"
    else
        # update flake.lock
        echo -e "${GREEN}Updating flake.lock...${NC}"
        nix flake update "$FLAKE_CONFIG_DIR" --impure

        # apply the updates
        echo -e "${GREEN}Rebuilding NixOS...${NC}"
        sudo nixos-rebuild switch --flake "$FLAKE_CONFIG_DIR" --impure
    fi
}
