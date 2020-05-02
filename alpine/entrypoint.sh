#!/bin/bash
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- telegraf "$@"
fi


if [ -n "$HDDTEMP_DEVICES" ]; then
    echo Running HDD Temp
    hddtemp -d $HDDTEMP_DEVICES
fi

exec "$@"