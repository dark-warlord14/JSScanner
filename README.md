# JSScanner

You can find the article related to this script here 
https://securityjunky.com/scanning-js-files-for-endpoint-and-secrets/

To install the required tools use
```
bash install.sh
```

Change the alive.txt with the domains you need to test. These are should be in below format
```
http://example.com
https://example2.com
```

To run the tool use
```
jsscanner path-to-urls-file

Eg. jsscanner hosts.txt
    jsscanner /root/tools/hosts.txt


```
