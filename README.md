# JSScanner

You can find the article related to this script here 
https://securityjunky.com/scanning-js-files-for-endpoint-and-secrets/

To install the required tools use
```
bash install.sh
```

Change the alive.txt with the domains you need to test. These should be in below format
```
http://example.com
https://example2.com
```

To run the tool use 
```
jsscanner path_to_alive.txt

Eg. jsscanner alive.txt
```


Thanks to [@amiralkizaru](https://github.com/amiralkizaru), [@LifeHack3r](https://github.com/LifeHack3r) and [@g33kyshivam](https://github.com/g33kyshivam) for the contribution.
