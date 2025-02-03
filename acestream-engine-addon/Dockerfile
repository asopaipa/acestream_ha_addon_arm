# Usa la imagen original como base
FROM futebas/acestream-engine-arm

# Copia el script de arranque en la raíz del contenedor
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expón los puertos necesarios (ajusta según lo que requiera el engine)
EXPOSE 6878

# Define el entrypoint del add-on
ENTRYPOINT [ "/run.sh" ]
