#!/usr/bin/env bashio

# Obtener variables de configuración
ALLOW_REMOTE_ACCESS=$(bashio::config 'ALLOW_REMOTE_ACCESS')
PRODUCT_KEY=$(bashio::config 'PRODUCT_KEY')
MAX_CONNECTIONS=$(bashio::config 'MAX_CONNECTIONS')

# Exportar variables de entorno para AceStream
export ALLOW_REMOTE_ACCESS=${ALLOW_REMOTE_ACCESS}

# Si el PRODUCT_KEY no está vacío, establecerlo
if [ -n "$PRODUCT_KEY" ]; then
  export PRODUCT_KEY=${PRODUCT_KEY}
fi

export MAX_CONNECTIONS=${MAX_CONNECTIONS}

# Imprimir información de configuración
bashio::log.info "Iniciando AceStream Engine con la siguiente configuración:"
bashio::log.info "ALLOW_REMOTE_ACCESS: ${ALLOW_REMOTE_ACCESS}"
bashio::log.info "MAX_CONNECTIONS: ${MAX_CONNECTIONS}"
if [ -n "$PRODUCT_KEY" ]; then
  bashio::log.info "PRODUCT_KEY: Configurado"
else
  bashio::log.info "PRODUCT_KEY: No configurado"
fi

# Verificamos que estos son los comandos de ejecución correctos según el contenedor original
if [ -f "/entrypoint.sh" ]; then
  # Si existe el script entrypoint.sh en el contenedor original, lo usamos
  bashio::log.info "Ejecutando entrypoint.sh del contenedor original"
  exec /entrypoint.sh
else
  # Si por alguna razón no existiera el entrypoint.sh, ejecutamos directamente el engine
  # (Esto es una alternativa, pero probablemente no sea necesario)
  bashio::log.info "Ejecutando acestream directamente"
  exec /acestreamengine --client-console --allow-remote-access=${ALLOW_REMOTE_ACCESS} --max-connections=${MAX_CONNECTIONS}
fi
