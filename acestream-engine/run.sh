#!/usr/bin/env bash

CONFIG_FILE="/data/options.json"

if [ -f "$CONFIG_FILE" ]; then
    # Extraer el valor de ALLOW_REMOTE_ACCESS (se asume que es un string o booleano)
    ALLOW_REMOTE_ACCESS=$(jq -r '.ALLOW_REMOTE_ACCESS // "false"' "$CONFIG_FILE")
else
    echo "No se encontró $CONFIG_FILE, usando valor por defecto."
    ALLOW_REMOTE_ACCESS="false"
fi

echo "Allow remote access: $ALLOW_REMOTE_ACCESS"

# Aquí continuarías con el resto de tu script


# Imprimir información de configuración
bashio::log.info "Iniciando AceStream Engine con la siguiente configuración:"
bashio::log.info "ALLOW_REMOTE_ACCESS: ${ALLOW_REMOTE_ACCESS}"


# Construir comandos con parámetros originales y personalizados
COMMAND_ARGS="--client-console --live-cache-type memory --live-mem-cache-size 104857600 --disable-sentry --log-stdout"

# Añadir nuestros parámetros personalizados
COMMAND_ARGS="$COMMAND_ARGS --allow-remote-access=${ALLOW_REMOTE_ACCESS} "



# Ejecutar main.py con todos los parámetros
bashio::log.info "Ejecutando main.py con los siguientes parámetros:"
bashio::log.info "python main.py $COMMAND_ARGS"

# Ejecutar el comando
cd /acestream
exec /acestream/python/bin/python ./main.py --allow_remote_access=yes --client-console --live-cache-type memory --live-mem-cache-size 104857600 --disable-sentry --log-stdout 
