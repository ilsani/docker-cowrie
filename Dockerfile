FROM ubuntu:16.04

COPY build.sh /build/bin/

RUN /bin/bash /build/bin/build.sh

COPY supervisor/*.conf /etc/supervisor/conf.d/

COPY bin/cowrie /home/cowrie/cowrie/bin
COPY conf/cowrie.cfg /home/cowrie/cowrie
COPY data/userdb.txt /home/cowrie/cowrie/data

RUN chown -R cowrie:cowrie /home/cowrie && \
    chmod +x /home/cowrie/cowrie/bin/*

EXPOSE 2222 2223

CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisor/supervisord.conf"]
