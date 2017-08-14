docker run --name http-proxy -d --rm --publish 80:80 --publish 443:443 --volume /var/www/ssl:/etc/letsencrypt --volume /var/www/html:/usr/share/nginx/html --network service_net http-proxy
