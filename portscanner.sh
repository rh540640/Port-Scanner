#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <target_ip>"
  exit 1
fi

target_ip=$1

echo "Scanning $target_ip for open ports..."

# Run nmap scan on target IP address
nmap_scan=$(nmap -p- --open $target_ip)

# Extract open port numbers from nmap scan results
open_ports=$(echo "$nmap_scan" | grep -oP '\d{1,5}/open' | cut -d '/' -f 1 | tr '\n' ',' | sed 's/,$//')

if [ -z "$open_ports" ]; then
  echo "No open ports found on $target_ip"
else
  echo "Open ports found on $target_ip: $open_ports"
fi	
