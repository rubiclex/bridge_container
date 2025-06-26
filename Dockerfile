FROM node:22.12.0-alpine AS builder
WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN git clone https://github.com/DSSoftware/SBU-Bridge.git

RUN apk update && apk add build-base g++ cairo-dev pango-dev giflib-dev

# Install pnpm and install all dependencies
RUN npm install -g pnpm \
    && pnpm install

CMD [ "node" ]
