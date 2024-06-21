#!/usr/bin/bash

# tools
gcc
#kitty
wezterm

# work
dbeaver # will be dbeaver-bin in 24.05+
docker
globalprotect-openconnect
# postman
bruno # postman does not work
slack
# teams # has been removed as it is no longer supported 
zoom-us

# update first
sudo apt update

# core dependencies
CORE=(
    ca-certificates
    curl
    wget
    # java
    default-jre
    default-jdk
)
sudo apt install "${CORE[@]}"

# add repos to apt

## docker - https://docs.docker.com/engine/install/ubuntu/
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## bruno - https://www.usebruno.com/downloads
sudo mkdir -p /etc/apt/keyrings
sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/bruno.gpg --keyserver keyserver.ubuntu.com --recv-keys 9FA6017ECABE0266

## dbeaver - https://dbeaver.io/download/
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
echo "deb [signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list

## wezterm - https://wezfurlong.org/wezterm/install/linux.html
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# update apt
sudo apt update

# install packages
PACKAGES=(
    # development tools
    git
    gh
    neovim
    # programs
    firefox
    # utils
    fzf
    ripgrep
    zip
    unzip
    # utils
    # personal
    # work
    bruno # postman alternative
    dbeaver-ce
    # -- start docker
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
    # -- end docker
    slack
    virtualbox
)
sudo apt install "${PACKAGES[@]}"

# oh-my-zsh - https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Git Credential Manager
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
git config --global credential.credentialStore gpg

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
