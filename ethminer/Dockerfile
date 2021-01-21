FROM nvidia/cuda:11.1-devel-ubuntu20.04 AS build

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        git \
        build-essential \
        cmake \
    && \
    apt-get clean

WORKDIR /ethminer-repo
ARG BRANCH=master
RUN git clone -b ${BRANCH} https://github.com/ethereum-mining/ethminer.git . && \
    git submodule update --init --recursive
RUN mkdir build && \
    cd build && \
    cmake .. -DETHASHCL=OFF -DBINKERN=OFF && \
    make && \
    make install

FROM nvidia/cuda:11.1-runtime-ubuntu20.04
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean
COPY --from=build /usr/local/bin/ethminer /usr/local/bin/ethminer
WORKDIR /ethminer
COPY entrypoint.sh .
ENTRYPOINT [ "/ethminer/entrypoint.sh" ]