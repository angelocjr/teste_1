#!/bin/bash
set -e

# Remover arquivos de servidor antigos
rm -f tmp/pids/server.pid

# Executar comandos passados no docker-compose
exec "$@"
