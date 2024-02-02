ARG version=v2.2.0

FROM terrarebirth/opzd:${version}

ARG chainid=paradise-1

ENV CHAINID ${chainid}

# Moniker will be updated by entrypoint.
RUN opzd init --chain-id $chainid moniker

# Backup for templating
RUN mv ~/.opzapp/config/config.toml ~/config.toml
RUN mv ~/.opzapp/config/app.toml ~/app.toml

RUN if [ "$chainid" = "paradise-1" ] ; then wget -O ~/.opzapp/config/genesis.json https://columbus-genesis.s3.ap-northeast-1.amazonaws.com/columbus-5-genesis.json; fi
RUN if [ "$chainid" = "paradise-1" ] ; then wget -O ~/.opzapp/config/addrbook.json https://network.terra.dev/addrbook.json; fi

RUN if [ "$chainid" = "biden-1" ] ; then wget -O ~/.opzapp/config/genesis.json https://raw.githubusercontent.com/terra-money/testnet/master/bombay-12/genesis.json; fi
RUN if [ "$chainid" = "biden-1" ] ; then wget -O ~/.opzapp/config/addrbook.json https://raw.githubusercontent.com/terra-money/testnet/master/bombay-12/addrbook.json; fi

RUN apk update && apk add wget lz4 aria2 curl jq gawk coreutils

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["/usr/local/bin/terrad", "start"]