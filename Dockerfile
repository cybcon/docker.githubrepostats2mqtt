FROM alpine:3.23.3

LABEL maintainer="Michael Oberdorf IT-Consulting <info@oberdorf-itc.de>"
LABEL site.local.program.version="1.0.0"

ENV MQTT_SERVER=localhost \
    MQTT_PORT=1883 \
    MQTT_TLS_enabled=false \
    MQTT_TLS_no_hostname_validation=false \
    MQTT_RETAIN=false \
    REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt \
    MQTT_TOPIC_REPO_EXTENSION=false

RUN apk upgrade --available --no-cache --update \
    && apk add --no-cache --update \
       bash=5.3.3-r1 \
       ca-certificates=20251003-r0 \
       curl=8.17.0-r1 \
       jq=1.8.1-r0 \
       mosquitto-clients=2.0.22-r0

COPY --chown=root:root /src /

USER 5242:5242

# Start Process
ENTRYPOINT ["/entrypoint.sh"]
