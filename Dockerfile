FROM mback2k/ubuntu:rolling

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ndppd && \
    apt-get clean

RUN mkdir /etc/ndppd
RUN touch /etc/ndppd/ndppd.conf

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

CMD ["/usr/sbin/ndppd"]
