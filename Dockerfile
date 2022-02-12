FROM node:16.14.0-alpine

WORKDIR /app

COPY ./src ./src
COPY ./public ./public
COPY ./package.json ./package.json
COPY ./tsconfig.json ./tsconfig.json
COPY ./yarn.lock ./yarn.lock

# Install packages
RUN set -eux; \
    # Packages to install
    apk add --no-cache \
        git \
        python3 \
        make \
        g++ \
    && \
    # Clean out directories that don't need to be part of the image
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yarn && yarn build
