FROM --platform=arm64 arm64v8/openjdk:21-slim-bullseye

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
  && apt upgrade --yes \
  && apt install --yes --no-install-recommends \
    wget

WORKDIR /osmosis

RUN wget https://github.com/openstreetmap/osmosis/releases/download/0.48.3/osmosis-0.48.3.tgz

RUN tar -xvzf osmosis-0.48.3.tgz \
  && rm osmosis-0.48.3.tgz \
  && chmod a+x /osmosis/bin/osmosis

ENTRYPOINT ["/osmosis/bin/osmosis"]
