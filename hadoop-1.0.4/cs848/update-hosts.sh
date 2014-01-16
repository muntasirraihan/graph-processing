#!/bin/bash

hostname=$(hostname)

if [[ "$hostname" == "cloud0" ]]; then
    name=cloud
    nodes=4
elif [[ "$hostname" == "cld0" ]]; then
    name=cld
    nodes=8
elif [[ "$hostname" == "c0" ]]; then
    name=c
    nodes=16
else
    echo "Invalid hostname"
    exit -1
fi

for ((i=1;i<=${nodes};i++)); do
    sudo scp /etc/hosts ${name}$i:/etc/hosts
    sudo ssh ${name}$i "echo \"${name}${i}\" > /etc/hostname"
done