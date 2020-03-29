#!/bin/bash

mkdir js
mkdir db
linkf=~/tools/LinkFinder/linkfinder.py

for i in $(cat alive.txt)
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
        echo "$i done"
done
echo "Script is done."
