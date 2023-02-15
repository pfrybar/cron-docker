FROM alpine:3.15

RUN apk add --no-cache tini docker
COPY ./run.sh /opt/run.sh

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/sh", "/opt/run.sh"]
