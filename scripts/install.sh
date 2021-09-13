#!/bin/bash

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

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

# vnc
if [ ! -f ~/.vnc/passwd ]; then
    echo setup a vnc password
    vncpasswd
fi
ln -s $DIR/vnc.sh ~/vnc.sh || true
chmod +x ~/vnc.sh
ln -s $DIR/../.vnc/xstartup ~/.vnc || true
chmod +x $DIR/../.vnc/xstartup

sudo tee /etc/systemd/system/vnc.service << 'EOF'
[Unit]
Description=Spark service

[Service]
Type=forkig
User=tcolar
ExecStart=/home/tcolar/vnc.sh

[Install]
WantedBy=multi-user.target
EOF
sudo chmod +x /etc/systemd/system/vnc.service
sudo systemctl restart vnc
sudo systemctl enable vnc

# end
echo Done
echo You should run: source ~/.zshrc