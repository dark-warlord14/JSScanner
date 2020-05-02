#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
END='\033[0m'


QUOTES=(
	"Activating 1337 mode!"
	"Target uses Equifax-grade security."
	"ᕕ( ᐛ )ᕗ"
	"ᕕ( ᐕ )ᕗ"
	"三三ᕕ( ᐛ )ᕗ"
	"ᐠ( ᐛ )ᐟ"
	"Never gonna give you up."
	"Js pls."
	"Update pls."
	"Sleep is for the weak."
	"Grab a cuppa!"
	"js, js+ on steroids."
	"I am 100 percent natural."
	"A bug is never just a mistake. It represents something bigger. An error of thinking that makes you who you are."
	"You hack people. I hack time."
	"I hope you don't screw like you type."
	"Hack the planet!"
	"Crypto stands for cryptography."
	"PoC||GTFO"
)

rand=$((RANDOM % ${#QUOTES[@]}))
printf "${YELLOW}[i]${END} ${QUOTES[$rand]}\\n"
echo

if [[ $# -eq 0 ]] ; then
    printf '\nNo Host File or Path-to-file Given!'
    printf '\n\nUsage: jsscanner path-to-hosts-file\n\n'
    exit 0
fi


mkdir $1-Jsscanner-results
cd $1-Jsscanner-results

mkdir js
mkdir db


linkf=~/tools/LinkFinder/linkfinder.py

for i in $(cat $1)
do
        n1=$(echo $i | awk -F/ '{print $3}')
        n2=$(echo $i | awk -F/ '{print $1}' | sed 's/.$//')
        mkdir js/$n1-$n2
        mkdir db/$n1-$n2
        timeout 30 python3 $linkf -d -i $i -o cli > js/$n1-$n2/raw.txt

        jslinks=$(cat js/$n1-$n2/raw.txt | grep -oaEi "https?://[^\"\\'> ]+" | grep '\.js' | grep "$n1" | sort -u)

        if [[ ! -z $jslinks ]]
        then
                for js in $jslinks
                do
                        python3 $linkf -i $js -o cli >> js/$n1-$n2/linkfinder.txt
                        echo "$js" >> js/$n1-$n2/jslinks.txt
			wget $js -P db/$n1-$n2/ -q
                done
        fi
        printf "${GREEN}[+]${END} $i ${YELLOW}done${END}.\\n"
done
printf "${YELLOW}[+]${END} Script is done.\\n"
