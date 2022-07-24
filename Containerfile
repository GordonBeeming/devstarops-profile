FROM docker.io/library/nginx:stable-alpine

COPY src/ /www/profile/
COPY nginx.conf /etc/nginx/nginx.conf
