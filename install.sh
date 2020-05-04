#!/bin/bash

cwd=$(pwd)

if [[ ! -d ~/tools ]]
then
	mkdir ~/tools
else
	printf "tools folder present...\n\n"
fi
cd ~/tools

if [[ ! -d ~/tools/LinkFinder ]]
then
	git clone https://github.com/dark-warlord14/LinkFinder
else
	printf "LinkFinder already present in tools folder...!\n\n"
fi
sudo apt install wget -y
sudo apt install python3-pip

cd LinkFinder

sudo pip3 install -r requirements.txt
sudo python3 setup.py install


sudo chmod +x $cwd/script.sh


echo "alias jsscanner='$cwd/script.sh'" >> ~/.bash_profile

. $HOME/.bash_profile

echo "All set bro"
