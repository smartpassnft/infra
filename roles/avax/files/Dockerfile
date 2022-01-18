FROM golang:1.17.1-buster as buildy 

ARG avax_ver 

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash=5.0-4 git=1:2.20.1-2+deb10u3 make=4.2.1-1.2 \
      gcc=4:8.3.0-1 musl-dev=1.1.21-2 ca-certificates=20200601~deb10u2 \
      linux-headers-amd64

WORKDIR /build
RUN git clone https://github.com/ava-labs/avalanchego && \
    cd avalanchego && \
    git checkout tags/v$avax_ver && \
    go mod download && \
    ./scripts/build.sh

##############################
FROM debian:10.10-slim 

ARG avax_ver 
# TODO: move avax to system user. avalanchego default directory are to `avax` user home directory (/home/avax)
ARG userid 
ARG groupid 

RUN mkdir -p /avalanchego/build && \
    addgroup --gid $groupid avax && \
    adduser --uid $userid --gid $groupid \
            --shell /bin/sh --disabled-login \
            --disabled-password --quiet avax  && \
    mkdir -p /var/lib/avax/staking/local && \
    chown -R avax:avax /avalanchego /var/lib/avax
USER avax

ENV AVAXGO_CONFIG_DIR="/var/lib/avax"

WORKDIR /avalanchego/build
COPY --from=buildy /build/avalanchego/staking/local /var/lib/avax/staking/local
COPY --from=buildy /build/avalanchego/build /avalanchego/build 

ENTRYPOINT ["./avalanchego"]
