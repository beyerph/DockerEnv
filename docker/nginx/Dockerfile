FROM nginx:1.13.2

ARG SERVER_NAME

COPY etc/conf.d/default.tmpl /tmp/default.tmpl
RUN envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /tmp/default.tmpl > /etc/nginx/conf.d/default.conf
RUN cat /etc/nginx/conf.d/default.conf;


COPY etc/global/* /etc/nginx/global/
