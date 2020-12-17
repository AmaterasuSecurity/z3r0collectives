  
Start-Job -Name "Install and Configure Chocolatey" -ScriptBlock {
Write-Host "Installing Chocolatey"
# Ensure we can run everything
Set-ExecutionPolicy Bypass -Scope Process -Force
# Setting up directories for values
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=useFipsCompliantChecksums
choco feature enable -n=useEnhancedExitCodes
choco config set commandExecutionTimeoutSeconds 14400
choco config set --name="'cacheLocation'" --value="'C:\temp\chococache'"
choco config set --name="'proxyBypassOnLocal'" --value="'true'"
}
Start-Job -Name "Update all Chocolatey Packages" -ScriptBlock {choco upgrade all}

Start-Job -Name "Install Windows Updates" -ScriptBlock {
Write-Host "Install Latest Windows Updates"
choco install pswindowsupdate
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll 
Get-WuInstall -AcceptAll -IgnoreReboot
}

Start-Job -Name "Software Installation Part 1" -ScriptBlock{
Write-Host "Installing Browsers"
choco install chrome firefox brave

Write-Host "Installing DevTools"
choco install vscode vscode-python

Write-Host "Installing Tools"
choco install cherrytree

Write-Host "Installing Misc"
choco install greenshot zoom
}

Start-Job -Name "Software Installation Part 2" -ScriptBlock{
Write-Host "Installing VMWare"
choco install wmwareworkstation
#Larger installations

Write-Host "Installing Game Clients"
choco install steam epicgameslauncher battle.net origin

Write-Host "Installing Audacity"
choco install audacity audacity-lame audacity--ffmpeg

Write-Host "Installing Python"
choco install python

Write-Host "Installing Discord"
choco install discord

Write-Host "Installing Adobe"
choco install adobereader

Write-Host "Installing StreamLabs"
choco install streamlabs-obs

Write-Host "Installing Tools"
choco install wireshark

}