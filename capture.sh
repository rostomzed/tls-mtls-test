#!/bin/bash

PORT=$1

# Start capture
echo "Starting capture on port $PORT..."
sudo tcpdump -i en0 -w tls.pcap port $PORT
