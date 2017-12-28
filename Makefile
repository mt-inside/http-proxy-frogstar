build:
	docker build . --pull -t http-proxy

run:
	docker run -d --name http-proxy --rm --publish 80:80 --publish 443:443 --volume /var/www/ssl:/etc/letsencrypt --volume /var/www/html:/usr/share/nginx/html --network service_net http-proxy

run-fg:
	docker run -it --name http-proxy --rm --publish 80:80 --publish 443:443 --volume /var/www/ssl:/etc/letsencrypt --volume /var/www/html:/usr/share/nginx/html --network service_net http-proxy

run-shell:
	docker run -it --name http-proxy --rm --publish 80:80 --publish 443:443 --volume /var/www/ssl:/etc/letsencrypt --volume /var/www/html:/usr/share/nginx/html --network service_net http-proxy /bin/sh

exec-shell:
	docker exec -it http-proxy /bin/sh
