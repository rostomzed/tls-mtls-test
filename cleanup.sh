#!/bin/bash

# clean up
echo "Cleaning up keys, certs and csrs..."
rm -f *.crt *.key *.srl *.csr

echo "Cleaning up pcap files..."
rm -f *.pcap
