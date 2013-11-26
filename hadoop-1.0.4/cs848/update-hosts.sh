#!/bin/bash -e

nodes=4

for ((i=1;i<=${nodes};i++)); do
    sudo scp /etc/hosts cloud$i:/etc/hosts
    sudo ssh cloud$i "echo \"cloud${i}\" > /etc/hostname"
done