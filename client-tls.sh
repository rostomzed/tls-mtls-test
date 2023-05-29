#!/bin/bash

PORT=$1

# Start client - no client certificate
openssl s_client -connect 127.0.0.1:$PORT