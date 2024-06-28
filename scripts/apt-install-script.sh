#!/usr/bin/bash

lemonsir-install-apps () {
echo "Setting things up..."
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
sudo apt install "${CORE[@]}" -y

# add repos to apt

echo "\rAdding GPG keys etc."
## docker - https://docs.docker.com/engine/install/ubuntu/
if ! command -v docker &> /dev/null; then
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

## bruno - https://www.usebruno.com/downloads
if ! command -v bruno &> /dev/null; then
    sudo mkdir -p /etc/apt/keyrings
    sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/bruno.gpg --keyserver keyserver.ubuntu.com --recv-keys 9FA6017ECABE0266
fi

## dbeaver - https://dbeaver.io/download/
if ! command -v dbeaver &> /dev/null; then
    curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
    echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
    echo "deb [signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list
fi

## wezterm - https://wezfurlong.org/wezterm/install/linux.html
if ! command -v wezterm &> /dev/null; then
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
fi

# update apt
sudo apt update

echo "\rInstalling packages..."
# install packages
PACKAGES=(
    # development tools
    git
    gh
    neovim
    zsh
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
    # bruno # postman alternative
    # dbeaver-ce
    # -- start docker
    docker-ce
    docker-ce-cli
    containerd.io
    docker-buildx-plugin
    docker-compose-plugin
    # -- end docker
    slack
    virtualbox
    wezterm
)
sudo apt install "${PACKAGES[@]}" -y --ignore-missing

echo "\rMore manual installations..."
hc # Git Credential Manager
if ! command -v git-credential-manager &> /dev/null; then
    curl -L https://aka.ms/gcm/linux-install-source.sh | sh
    git-credential-manager configure
    git config --global credential.credentialStore gpg
fi

# lazygit
if ! command -v lazygit &> /dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
fi

# oh-my-zsh - https://ohmyz.sh/#install
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
}
