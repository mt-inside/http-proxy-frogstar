# Debian, 8 at last check
FROM nginx

COPY nginx-config/ /etc/nginx/

COPY htdocs/ /usr/share/nginx/html

RUN cd /var/log/nginx && \
    mkdir $(ls /etc/nginx/sites-enabled)

RUN mkdir -p /spool/nginx/cache


# == Let's Encrypt ==
# No debian pacakges for letsencrypt
RUN apt update && apt install -y --no-install-recommends wget && rm -rf /var/lib/apt/lists/*
RUN wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto

# Install deps at build-time using its bootstrap script
RUN ./certbot-auto --noninteractive --agree-tos --os-packages-only

VOLUME /etc/letsencrypt


# Can't publish a port during docker build (makes sense). Thus certbot can't get
# certs during build, so we do it at first run. This is actually better cause it
# stops certs expiring between build and run.
COPY cmd.sh /
CMD /cmd.sh
