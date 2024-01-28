#!/bin/bash

read -p "First container : " first
read -p "Last container :  " last

for i in $(seq $first $last)
do
  pct create $i local:vztmpl/debian-11-standard_11.3-1_amd64.tar.zst \
    -arch amd64 \
    -ostype ubuntu \
    -hostname $i \
    -cores 1 \
    -memory 512 \
    -swap 1 \
    -storage local-lvm \
    -password pass \
    -net0 name=eth0,bridge=vmbr1,gw=192.168.1.254,ip=192.168.1.$i/24,type=veth
done
