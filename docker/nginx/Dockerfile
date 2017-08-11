FROM nginx:1.13.2

ARG HOSTNAMES

COPY etc/conf.d/default.tmpl /tmp/default.tmpl

RUN export IFS=","; for HOST in $HOSTNAMES; do export HOST=$HOST; envsubst '${HOST}' < /tmp/default.tmpl > /etc/nginx/conf.d/$HOST.conf; done


COPY etc/global/* /etc/nginx/global/
