# Telegraf

It's a regular Telegraf image extended with hddtemp and smartctl to measure HDD hardware metrics.

Included *telegraf.conf* is a configuration I'm using to gather metrics from a Linux box of mine - it's my docker host BTW.

## Example use

This is my **docker-compose.yml** to make it running.

```yaml
version: "3.6"

services:
  telegraf:
    image: ipatalas/telegraf
    container_name: telegraf
    restart: always
    privileged: true
    networks:
      - local
    volumes:
      - ${PWD}/telegraf.conf:/etc/telegraf/telegraf.conf:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - /:/hostfs:ro
      - /run/udev:/run/udev:ro
    environment:
      - HOST_PROC=/hostfs/proc
      - HOST_MOUNT_PREFIX=/hostfs
      - HDDTEMP_DEVICES=/dev/sd[ab]

networks:
  ...
```