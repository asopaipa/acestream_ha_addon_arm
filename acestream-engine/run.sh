#!/bin/sh

# Ejecutar el comando
cd /acestream
exec /acestream/python/bin/python ./main.py --client-console --live-cache-type memory --live-mem-cache-size 104857600 --disable-sentry --log-stdout $COMMAND_ARGS
