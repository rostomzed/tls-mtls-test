# SSL/TLS

## Pre-requisites

### Install OpenSSL

#### macOS
```bash
brew install openssl
```

#### Ubuntu
```bash
sudo apt-get install openssl
```

#### CentOS
```bash
sudo yum install openssl
```

#### Windows
- Download and install [chocolatey](https://chocolatey.org/install)
- Install openssl
```bash
choco install openssl
```
Or run it using Windows Subsystem for Linux (WSL) if you have it installed
```bash
openssl version # check if it's installed otherwise install it as shown above in Ubuntu or CentOS
```

## Usage

### Use Makefile
Use the following commands to generate certificates and start TLS server and client with or without mutual authentication.

```bash
make # or make help to see the list of available commands
```

```bash
make certs                            (generate certificates)
make server-tls port=<port-number>    (start TLS server with server/unilateral authentication)
make client-tls port=<port-number>    (start TLS client with server/unilateral authentication)
make server-mtls port=<port-number>   (start TLS server with client/mutual authentication)
make client-mtls port=<port-number>   (start TLS client with client/mutual authentication)
make capture port=<port-number>       (start tcpdump on port 8443)
make clean-all                        (remove all generated files)
make clean-certs                      (remove generated certificates)
make clean-capture                    (remove capture file)
make help                             (this message)
```


## Use bash

### Generate CA, Server and Client Keys and Certificates

```bash
./generate-certs.sh
```

### Start TLS Server

```bash
./server-tls.sh <port-number>
```

### Start TLS Client

```bash
./client-tls.sh <port-number>
```

### Start TLS Server and Client with Mutual Authentication

```bash
./server-mtls.sh <port-number>
```

```bash
./client-mtls.sh <port-number>
```

### Capture TLS Traffic

```bash
./capture.sh <port-number>
```

