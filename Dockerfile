FROM debian:jessie
MAINTAINER oliver@weichhold.com

RUN apt-get -y update && apt-get -y install build-essential libssl-dev libboost-all-dev libsodium-dev libdb5.3 \
    libdb5.3-dev libdb5.3++-dev libtool automake libevent-dev bsdmainutils git ntp make g++ gcc \
    autoconf cpp ngrep iftop sysstat autotools-dev pkg-config libminiupnpc-dev libzmq3-dev \
    libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev && \
    cd /tmp && git clone https://github.com/BTCGPU/BTCGPU && \
    cd BTCGPU && ./autogen.sh && ./configure --with-incompatible-bdb && make && make install && \
    rm -rf /tmp/*

RUN mkdir /data && chmod 777 /data && touch /data/bgold.conf

EXPOSE 8232 8233
WORKDIR /tmp
ENTRYPOINT bgoldd -server -testnet -datadir=/data -rpcuser=user -rpcpassword=pass -port=8233 -rpcport=8232 -rpcbind=0.0.0.0 -rpcallowip=::/0 -addnode=betatestnet.z.cash
