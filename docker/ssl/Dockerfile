FROM alpine

RUN apk --update add bash openssl

WORKDIR /certs

COPY gen-cer /usr/local/bin/gen-cer

CMD /usr/local/bin/gen-cer

VOLUME /certs