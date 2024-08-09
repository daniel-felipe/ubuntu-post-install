#!/bin/bash
#
# MIT License
#
# Copyright (c) 2023 Daniel Fagundes
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

# ---------------------------------------------------------
# Update Dependencies
# ---------------------------------------------------------
sudo apt update && sudo apt upgrade -y

# ---------------------------------------------------------
# Disable Telemetry
# ---------------------------------------------------------
sudo apt purge ubuntu-report apport apport-symptoms whoopsie popularity-contest -y
sudo apt autoremove -y

# ---------------------------------------------------------
# Install Development Tools
# ---------------------------------------------------------
sudo apt install software-properties-common curl wget

# PHP & Composer
sudo add-apt-repository ppa:ondrej/php
sudo apt install php8.3 composer php8.3-{bcmath,curl,dom,gd,imap,json,mbstring,mysql,odbc,pgsql,soap,sqlite3,xml,zip}

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
zsh "$HOME/.nvm/nvm.sh" install node

# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update 
sudo apt install neovim
sudo update-alternatives --install /usr/bin/editor editor "$(which nvim)" 60
sudo update-alternatives --config editor
git config --global core.editor nvim
echo "export EDITOR=nvim" >> "$HOME/.zshrc"

# Postman (WIP)
# wget https://dl.pstmn.io/download/latest/linux_64
# tar -xzvf postman-linux-x64.tar.gz -C "$HOME/.local/share"


# ---------------------------------------------------------
# Install General Tools
# ---------------------------------------------------------
sudo apt update

# ProtonVPN
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-3_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.3-3_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop
sudo apt install libayatana-appindicator3-1 gir1.2-ayatanaappindicator3-0.1 gnome-shell-extension-appindicator

# LocalSend
wget https://github.com/localsend/localsend/releases/download/v1.15.3/LocalSend-1.15.3-linux-x86-64.deb
sudo apt install ./LocalSend-*.deb

