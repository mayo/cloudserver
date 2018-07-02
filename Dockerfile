FROM node:6-slim
MAINTAINER Giorgio Regni <gr@scality.com>

WORKDIR /usr/src/app

# Keep the .git directory in order to properly report version
RUN apt-get update \
    && apt-get install -y jq python git build-essential libssl-dev --no-install-recommends

COPY ./package.json .

RUN npm install --production --unsafe-perm \
    && apt-get autoremove --purge -y python git build-essential libssl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && npm cache clear \
    && rm -rf ~/.node-gyp \
    && rm -rf /tmp/npm-*

COPY ./ ./

VOLUME ["/usr/src/app/localData","/usr/src/app/localMetadata"]

ENV NO_PROXY localhost,127.0.0.1
ENV no_proxy localhost,127.0.0.1

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
CMD [ "npm", "start" ]

EXPOSE 8000
