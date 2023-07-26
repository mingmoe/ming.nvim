
$origin = Get-Content "$PSScriptRoot/init.lua"
$dir = "$PSScriptRoot".Replace("`"","\`"")

$origin = $origin.Replace("#RUNTIME_PATH#","`"$dir/runtime`"".Replace("\","/"))

$origin | Out-File -Path "$PSScriptRoot/init.lua.compiled" 

