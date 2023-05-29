#!/bin/bash

# clean up
echo "Cleaning up..."
rm *.crt *.key *.srl *.csr

# Generate CA key:
echo "Generating CA key..."
openssl genrsa -out ca.key 2048

# Generate CA certificate:
echo "Generating CA certificate..."
openssl req -new -x509 -days 365 -key ca.key -out ca.crt -subj "/CN=ca"

# Generate server key:
echo "Generating server key..."
openssl genrsa -out server.key 2048

# Generate server signing request:
echo "Generating server signing request..."
openssl req -new -key server.key -out server.csr -subj "/CN=localhost"

# Self-sign server certificate:
echo "Self-signing server certificate..."
openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

# Generate client key:
echo "Generating client key..."
openssl genrsa -out client.key 2048

# Generate client signing request:
echo "Generating client signing request..."
openssl req -new -key client.key -out client.csr -subj "/CN=client"

# Self-sign client certificate:
echo "Self-signing client certificate..."
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 1825 -sha256