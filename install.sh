#!/bin/bash

cwd=$(pwd)

mkdir -p ~/tools
cd ~/tools

if [[ ! -d ~/tools/LinkFinder ]]
then
        git clone https://github.com/dark-warlord14/LinkFinder
else
        printf "LinkFinder already present in tools folder...!\n\n"
fi

sudo apt install wget -y

cd LinkFinder

sudo pip3 install -r requirements.txt
sudo python3 setup.py install


sudo touch ~/.bash_aliases
sudo chown $USER:$USER ~/.bash_aliases
sudo chmod 644 ~/.bash_aliases

echo "alias jsscanner='$cwd/script.sh'" >> ~/.bash_aliases

echo "All set bro, restart your terminal!"
