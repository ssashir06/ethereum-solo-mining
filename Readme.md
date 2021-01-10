# Overview

# Setup

## Requirements

- docker with nvidia cuda settings
- docker-compose v.1.27.0 or later

## `.env` file

Create a new file to set etherbase value.
Example:

```
ETHERBASE=0xF48AA12Fe736F40435a48D295ab6892016DD3a85
GETH_LOG_LEVEL=3
```

## Build & Run

```
docker-compose build
docker-compose up
```