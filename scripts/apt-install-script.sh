#!/usr/bin/bash

# add repos to apt

# update apt
sudo apt update

# install packages
sudo apt install \
    curl \
    zsh \
    ...

# Git Credential Manager
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
git config --global credential.credentialStore gpg

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
