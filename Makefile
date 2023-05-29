SHELL := /bin/bash

.DEFAULT_GOAL := help
.PHONY: help

help:
	@echo "make certs                            (generate certificates)"
	@echo "make server-tls port=<port-number>    (start TLS server with server/unilateral authentication)"
	@echo "make client-tls port=<port-number>    (start TLS client with server/unilateral authentication)"
	@echo "make server-mtls port=<port-number>   (start TLS server with client/mutual authentication)"
	@echo "make client-mtls port=<port-number>   (start TLS client with client/mutual authentication)"
	@echo "make capture port=<port-number>       (start tcpdump on port 8443)"
	@echo "make clean-all                        (remove all generated files)"
	@echo "make clean-certs                      (remove generated certificates)"
	@echo "make clean-capture                    (remove capture file)"
	@echo "make help                             (this message)"


certs:
	@echo "Generating certificates..."
	@./generate-certs.sh

server-tls:
	@echo "Starting TLS server..."
	@./server-tls.sh $(port)

client-tls:
	@echo "Starting TLS client..."
	@./client-tls.sh $(port)

server-mtls:
	@echo "Starting mTLS server..."
	@./server-mtls.sh $(port)

client-mtls:
	@echo "Starting mTLS client..."
	@./client-mtls.sh $(port)

capture:
	@echo "Starting tcpdump capture..."
	@sudo tcpdump -i en0 -n -s 0 -w tls.pcap port $(port)

clean-certs:
	@echo "Removing generated certificates..."
	@rm -f *.crt *.key *.srl *.csr

clean-capture:
	@echo "Removing capture file..."
	@rm -f *.pcap

clean-all:
	@echo "Removing generated files..."
	@./cleanup.sh


