FROM node:lts-alpine

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date="${BUILD_DATE}" \
      org.label-schema.name="daisy-media-server" \
      org.label-schema.description="A Node.js implementation of RTMP Media Server partially compatible with RolyPolyLand client" \
      org.label-schema.usage="https://github.com/youngive/daisy-media-server#readme" \
      org.label-schema.vcs-ref="${VCS_REF}" \
      org.label-schema.vcs-url="https://github.com/youngive/daisy-media-server" \
      org.label-schema.vendor="youngive" \
      org.label-schema.version="2.7.0" \
      maintainer="https://github.com/youngive"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm i

COPY . .

EXPOSE 1935 8000 8443

CMD ["node","bin/app.js"]