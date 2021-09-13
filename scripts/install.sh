#!/bin/bash

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
chmod +x $DIR/../.vnc/xstartup 

# install software
sudo apt-get update

sudo apt-get install -y \
  git \
  python3-pip \
  code \
  google-chrome-stable \
  gparted \
  golang \
  xscreensaver \
  meld \
  vim \
  zsh \
  wget \
  curl \
  gnupg2 \
  tightvncserver \
  xfce4 \
  xfce4-goodies

  
# install oh-my-zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install customrc files
rm ~/.customrc.sh
ln -s $DIR/../.customrc.sh ~
touch ~/.secrets.sh 
echo "source ~/.customrc.sh" >> ~/.zshrc 
echo "source ~/.secrets.sh" >> ~/.zshrc 

# qmk
python3 -m pip install --user qmk
qmk setup

# 1password
wget https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb -o /tmp/1password-latest.deb 
sudo dpkg -i /tmp/1password-latest.deb

# end
echo Done 
echo You should run: source ~/.zshrc