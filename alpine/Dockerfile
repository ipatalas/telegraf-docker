FROM telegraf:alpine

RUN echo 'hosts: files dns' >> /etc/nsswitch.conf
RUN apk add --no-cache hddtemp smartmontools

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]