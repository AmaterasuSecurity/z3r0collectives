# A Windows Privilege Escalation!
#This does...
#   + Version checks, patch checking, lists all drives
#   + List User Privileges
#   + Lists all users

systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
wmic qfe
whoami /priv
whoami /groups
net user
whoami /all
Get-LocalUser | Format-Table Name,Enabled,LastLogon
Get-ChildItem C:\Users -Force | Select-Object Name
