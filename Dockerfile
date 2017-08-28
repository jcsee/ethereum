FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive \
    USERNAME=e \
    HOME=/home/e

RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common \
 && add-apt-repository -y ppa:ethereum/ethereum \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
      ethereum \
      net-tools \
 && rm -rf /var/lib/apt/lists/*

RUN useradd --uid 1000 --groups dialout --no-create-home --shell /bin/bash --home-dir $HOME $USERNAME \
        && mkdir $HOME \
        && chown -R $USERNAME:$USERNAME $HOME

VOLUME $HOME/.ethereum/

USER $USERNAME

WORKDIR $HOME
