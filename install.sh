#!/bin/bash

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
apt install wget -y
cd LinkFinder

pip3 install -r requirements.txt
python3 setup.py install


sudo chmod +x ~/JSScanner/script.sh


echo "alias jsscanner='$HOME/JSScanner/script.sh'" >> ~/.bash_aliases
source ~/.bash_aliases

echo "All set bro"
