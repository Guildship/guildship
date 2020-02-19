### Backend

FROM elixir:1.9.4-alpine AS backend

RUN mix local.hex --force && mix local.rebar --force

WORKDIR /app

ENV MIX_ENV prod

# Copy required files for compilation
COPY ./mix.* ./
COPY deps deps
COPY config config
COPY priv priv
COPY assets assets

# We need make for argon2
RUN apk upgrade --no-cache && \
  apk add --no-cache make gcc libc-dev nodejs nodejs-npm

# Make sure we have the latest NPM cli
RUN npm install npm -g --no-progress

# Asset compilation
WORKDIR assets

RUN npm install
RUN npm run deploy

WORKDIR ..

# Update certs
RUN update-ca-certificates --fresh

# Cleanup
RUN rm -rf /var/cache/apk/*

# Get and compile deps
RUN mix deps.get
RUN mix deps.compile

### Packager

FROM backend as packager

COPY . /app

RUN mix phx.digest
RUN mix release --quiet

### RELEASE

FROM alpine:3.11

# We need bash and openssl for Phoenix
RUN apk upgrade --no-cache && \
  apk add --no-cache bash libressl libssl1.1

USER root

WORKDIR /app

COPY --from=packager /app/_build/prod/rel/guildship .

ENV PORT 8080
EXPOSE 8080

ENTRYPOINT [ "./bin/guildship", "start" ]
