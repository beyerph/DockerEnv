FROM nginx:1.13.2

ARG HOSTNAMES
ARG SHOPWARE_ENV

COPY etc/conf.d/default.tmpl /tmp/default.tmpl

### TIMEZONE
ENV TZ=Europe/Berlin

#RUN envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /tmp/default.tmpl > /etc/nginx/conf.d/default.conf
RUN export IFS=","; for HOST in $HOSTNAMES; do export HOST=$HOST; envsubst '${HOST} ${SHOPWARE_ENV}' < /tmp/default.tmpl > /etc/nginx/conf.d/$HOST.conf; done

COPY etc/global/* /etc/nginx/global/

COPY etc/.htpasswd /etc/nginx/