FROM telegraf

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get -y install hddtemp smartmontools && \
    rm -r /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]