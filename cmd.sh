./certbot-auto certonly --standalone --no-bootstrap --noninteractive --agree-tos --no-eff-email \
    --email="desborough@gmail.com" \
    --domains="frogstar-a.empty.org.uk,empty.org.uk"

#./certbot-auto install --nginx \
#    --cert-path /etc/letsencrypt/live/frogstar-a.empty.org.uk/cert.pem \
#    --fullchain-path /etc/letsencrypt/live/frogstar-a.empty.org.uk/fullchain.pem \
#    --key-path /etc/letsencrypt/live/frogstar-a.empty.org.uk/privkey.pem \
#    --no-bootstrap --noninteractive --agree-tos --no-eff-email --email="desborough@gmail.com" --domains="frogstar-a.empty.org.uk"

# standalone web server seems to take a while to die after the command above returns
sleep 10
exec nginx
