# A Windows Privilege Escalation!
#This does...
#   + OS and Version Checks
#   + List User Privileges
#   + Lists all users

systeminfo | findstr /B /C:"OS Name" /C:"OS Version" ### OS name and version
Get-ChildItem C:\Users -Force | Select-Object Name ### Lists all user profiles on machine.
net localgroup administrators ### Lists all administrator groups
