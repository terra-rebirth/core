FROM ubuntu:18.04

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install curl jq file

ARG UID=1000
ARG GID=1000
ARG entrypoint=entrypoint.sh

USER ${UID}:${GID}
VOLUME /opzd
WORKDIR /opzd
EXPOSE 26656 26657
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["start", "--log_format", "plain"]
STOPSIGNAL SIGTERM

COPY ${entrypoint} /usr/bin/entrypoint.sh
