#!/usr/bin/with-contenv bash
# La línea anterior asegura que se inyecten las variables de entorno del add-on

# Leer las variables configuradas en config.json
ACE_CONFIG_OPTION=${ACE_CONFIG_OPTION:-""}
ACE_PORT=${ACE_PORT:-6878}

echo "Iniciando Acestream Engine..."
echo "Parámetro de configuración: ${ACE_CONFIG_OPTION}"
echo "Puerto configurado: ${ACE_PORT}"

# Si fuese necesario, puedes escribir un archivo de configuración que incluya el puerto:
cat <<EOF > /config/acestream.conf
[acestream]
config_option = ${ACE_CONFIG_OPTION}
port = ${ACE_PORT}
EOF

# Inicia el engine.
# Ajusta el comando según sea necesario para que use el puerto configurado.
exec /acestreamengine --port ${ACE_PORT}
