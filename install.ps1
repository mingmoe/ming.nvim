
$rootDir = $PSScriptRoot
$tempDir = "$rootDir/temp"
$binaryDir = "$rootDir/binary"
$neovideDir = "$binaryDir/neovide"
$nvimRuntimePath = "$rootDir/runtime"

function Create-Dir(){
	param($dir);
	if(-not(Test-Path -PathType Container $dir)){
		mkdir $dir 
	}
}

function Download-For(){
	param($linux_url,$windows_url,$opt_dir);
	if($IsWindows){
		Invoke-WebRequest -Uri $windows_url -OutFile $opt_dir
	}
	else{
		Invoke-WebRequest -Uri $linux_url -OutFile $opt_dir
	}
}
Write-Host "Help yourself to download neovide and nvim"

# copy init.lua file
if($IsWindows){
	Create-Dir -dir "$HOME/AppData/Local/nvim"
	Copy-Item -Path "$PSScriptRoot/init.lua.compiled" -Destination "$HOME/AppData/Local/nvim/init.lua"
}
else{
	Create-Dir -dir "$HOME/.config/nvim"
	Copy-Item -Path "$PSScriptRoot/init.lua.compiled" -Destination "$HOME/.config/nvim/init.lua"
}

# install packer.nvim
if($IsWindows){
    &git clone "https://github.com/wbthomason/packer.nvim" "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
}
else {
    &git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

