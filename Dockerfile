FROM python:3.9-slim-buster
MAINTAINER Joel Farthing <joel.f.farthing@gmail.com>

ARG jsonnet_version=v0.17.0

WORKDIR /code/

VOLUME ["/code/src"]
VOLUME ["/code/dashboards"]

ADD ./scripts/cleanup.sh /code/scripts/cleanup.sh
RUN chmod u+x /code/scripts/cleanup.sh

ADD ./scripts/dashboards.py /code/scripts/dashboards.py

ADD https://github.com/google/jsonnet/releases/download/${jsonnet_version}/jsonnet-bin-${jsonnet_version}-linux.tar.gz /jsonnet.tar.gz
ADD https://github.com/grafana/grafonnet-lib/archive/master.tar.gz /grafonnet.tar.gz

RUN apt-get update && apt-get install -y curl jq git && apt-get clean && /code/scripts/cleanup.sh && \
    tar -C /bin -xvf /jsonnet.tar.gz && \
    tar -C / -xvf /grafonnet.tar.gz && \
    mv /grafonnet-lib-master /code/grafonnet-lib && \
    rm -f /jsonnet.tar.gz /grafonnet.tar.gz

