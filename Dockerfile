FROM registry.uxnr.de/ubuntu:rolling

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN apt-get update && \
    apt-get install -y \
        ndppd \
        supervisor && \
    apt-get clean

RUN mkdir /etc/ndppd
RUN touch /etc/ndppd/ndppd.conf

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
