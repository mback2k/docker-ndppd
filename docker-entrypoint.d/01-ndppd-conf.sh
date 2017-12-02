#!/bin/sh
set -e

# check environment varialbe INTERFACE
if [ -z "${INTERFACE}" ]; then
    echo "Environment variable INTERFACE should be in format 'eth0'"
    exit 1
fi

# check environment variable IP6RANGE
if [ -z "${IP6RANGE}" ]; then
    echo "Environment variable IP6RANGE should be in format '2000:000::/80'"
    exit 2
fi

echo "proxy ${INTERFACE} { rule ${IP6RANGE} { auto } }" > /etc/ndppd.conf
