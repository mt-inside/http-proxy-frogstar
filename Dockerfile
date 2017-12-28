# nginx 1.13.x
# Debian 9
FROM nginx:1.13

RUN mkdir -p /spool/nginx/cache

COPY nginx-config/ /etc/nginx/


# Cert input
VOLUME /etc/letsencrypt


# This differs from the parent image's CMD in that e.g. it lacks a daemon flag
CMD ["nginx"]
