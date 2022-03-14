FROM node:17-alpine3.15

COPY entrypoint.sh /

WORKDIR /slidev

RUN npm config set registry https://registry.npm.taobao.org &&\
    # npm i -g @slidev/cli @slidev/theme-default @slidev/theme-seriph &&\
    chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
