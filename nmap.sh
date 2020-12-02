#!/bin/bash

echo "Enter Host IP Address : "
read HostIP

echo "Do you want to scan all ports or specify? Yes to scan all or No to specify"
read options

if [[ "$options" == "Yes" ]]
then
    ports="-p-"
else
    echo "Select the ports to scan:"
    read systemports
    p="-p "
    ports=${p}${systemports}
fi

echo "What switches do you want to use?"
read switches

echo "Running nmap now...."

nmap $switches $ports $HostIP