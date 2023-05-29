#!/bin/bash

PORT=$1
# Start client
openssl s_client -connect 127.0.0.1:$PORT -cert client.crt -key client.key -CAfile ca.crt