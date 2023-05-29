#!/bin/bash

PORT=$1

# Start server
openssl s_server -key server.key -cert server.crt -CAfile ca.crt -Verify 1 -accept $PORT