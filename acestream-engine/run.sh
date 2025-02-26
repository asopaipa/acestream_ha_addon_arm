#!/usr/bin/env bash

ALLOW_REMOTE_ACCESS=$(bashio::config 'ALLOW_REMOTE_ACCESS')
PRODUCT_KEY=$(bashio::config 'PRODUCT_KEY')
MAX_CONNECTIONS=$(bashio::config 'MAX_CONNECTIONS')

# Imprimir información de configuración
bashio::log.info "Iniciando AceStream Engine con la siguiente configuración:"
bashio::log.info "ALLOW_REMOTE_ACCESS: ${ALLOW_REMOTE_ACCESS}"
bashio::log.info "MAX_CONNECTIONS: ${MAX_CONNECTIONS}"
if [ -n "$PRODUCT_KEY" ]; then
  bashio::log.info "PRODUCT_KEY: Configurado"
else
  bashio::log.info "PRODUCT_KEY: No configurado"
fi

# Construir comandos con parámetros originales y personalizados
COMMAND_ARGS="--client-console --live-cache-type memory --live-mem-cache-size 104857600 --disable-sentry --log-stdout"

# Añadir nuestros parámetros personalizados
COMMAND_ARGS="$COMMAND_ARGS --allow-remote-access=${ALLOW_REMOTE_ACCESS} --max-connections=${MAX_CONNECTIONS}"

# Añadir PRODUCT_KEY si está configurado
if [ -n "$PRODUCT_KEY" ]; then
  COMMAND_ARGS="$COMMAND_ARGS --product-key=${PRODUCT_KEY}"
fi

# Ejecutar main.py con todos los parámetros
bashio::log.info "Ejecutando main.py con los siguientes parámetros:"
bashio::log.info "python main.py $COMMAND_ARGS"

# Ejecutar el comando
cd /acestream
exec /acestream/python/bin/python ./main.py --client-console --live-cache-type memory --live-mem-cache-size 104857600 --disable-sentry --log-stdout $COMMAND_ARGS
