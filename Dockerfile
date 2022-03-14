FROM node:17-alpine3.15

COPY entrypoint.sh /

WORKDIR /slidev

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
