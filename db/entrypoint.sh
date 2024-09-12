#!/bin/sh
# exit immediately if a command fails
set -e

/usr/local/bin/docker-entrypoint.sh postgres -c max_connections=$POSTGRES_MAX_CONNECTIONS -c shared_buffers=$POSTGRES_SHARED_BUFFERS
