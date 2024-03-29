FROM ghcr.io/mback2k/docker-ubuntu/bionic:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ndppd && \
    apt-get clean

RUN mkdir /etc/ndppd
RUN touch /etc/ndppd/ndppd.conf

VOLUME /etc/ndppd

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/sbin/ndppd"]
