#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

./certbot-auto renew --server https://acme-v02.api.letsencrypt.org/directory --manual

gcloud compute ssl-certificates create web-ssl-cert-$(date +%Y-%m-%d) --certificate /etc/letsencrypt/live/<your_domain_com>/fullchain.pem --private-key /etc/letsencrypt/live/<your_domain_com>/privkey.pem

gcloud compute target-https-proxies update web-alpha-https-target-proxy --ssl-certificates web-ssl-cert-$(date +%Y-%m-%d)

