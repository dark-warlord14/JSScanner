#!/bin/bash

mkdir ~/tools
cd ~/tools
git clone https://github.com/dark-warlord14/LinkFinder

apt install wget -y
cd LinkFinder

pip3 install -r requirements.txt
python3 setup.py install

echo "All set bro"
