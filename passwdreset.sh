#!/bin/bash

while IFS=: read u x nn rest; do if [ $nn -ge 1000 ]; then echo 'StrongPassw0rd!' | passwd $u; fi done < /etc/passwd
