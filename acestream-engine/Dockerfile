FROM futebas/acestream-engine-arm

#ADD alpine-minirootfs-3.21.0-armv7.tar.gz / # buildkit
#ADD alpine-minirootfs-3.21.0-aarch64.tar.gz / # buildkit
#CMD ["/bin/sh"]
#COPY /acestream /acestream # buildkit
#COPY /system /system # buildkit
#ENV ACESTREAM_HOME=/acestream
#ENV ANDROID_ROOT=/system
#ENV ANDROID_DATA=/data
#ENV PYTHONHOME=/acestream/python
#ENV PYTHONPATH=/acestream/python/lib/stdlib:/acestream/python/lib/modules:/acestream/data:/acestream/modules.zip:/acestream/eggs-unpacked:/acestream/lib
#ENV LD_LIBRARY_PATH=/system/lib64:/system/lib:/acestream/python/lib
#ENV TEMP=/tmp
#ENV PATH=/acestream/python/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#ADD main.py dnsproxyd.py /acestream # buildkit
#WORKDIR /acestream
#CMD ["python" "main.py" "--client-console" "--live-cache-type" "memory" "--live-mem-cache-size" "104857600" "--disable-sentry" "--log-stdout"]

# Etiquetas para Home Assistant
LABEL io.hass.version="1.0.0" io.hass.type="addon" io.hass.arch="armhf|armv7|aarch64"

# Copiar script de ejecución
COPY run.sh /
RUN chmod a+x /run.sh

# Configurar entrypoint
ENTRYPOINT ["/run.sh"]
