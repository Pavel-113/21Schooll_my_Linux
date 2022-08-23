FROM nginx

COPY ./server/minisrv.c /web/minisrv.c
COPY ./server/starter.sh /web/starter.sh
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

USER root

RUN apt-get update ; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/*

RUN useradd -d /home/boogerman -m -s /bin/bash boogerman; \
    usermod -aG adm,nginx boogerman; \
    chown -R boogerman:boogerman /web; \
    chown -R boogerman:boogerman /var/cache/nginx/; \
    chown -R boogerman:boogerman /var/run/; \
    chmod u-s usr/bin/gpasswd \
    bin/mount bin/umount bin/su usr/bin/chfn \
    usr/bin/newgrp usr/bin/chsh usr/bin/passwd; \
    chmod g-s sbin/unix_chkpwd usr/bin/chage \
    usr/bin/expiry usr/bin/wall;

WORKDIR /web/

USER boogerman

HEALTHCHECK --interval=10s --timeout=30s --start-period=5s --retries=3 CMD curl -sS 127.0.0.1 || exit 1

ENTRYPOINT ["sh", "./starter.sh"]