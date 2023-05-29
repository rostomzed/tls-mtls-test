#!/bin/bash

PORT=$1
echo "Starting server on port $PORT..."

# Start server - no client certificate
openssl s_server -key server.key -cert server.crt -accept $PORT