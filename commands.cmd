podman build -f .\Containerfile -t profile

podman stop -a

podman exec -it d2c0efc761b4acd0b7fd3bc44a6c07c12c74d9a16c5655a6c5aa4f86f5859cb9 /usr/sbin/nginx -s reload

podman run -p 8080:80 --name profile --restart unless-stopped --replace --tls-verify -d -v nginx.conf:/etc/nginx/nginx.conf -v ./resources/access.log:/var/log/nginx/access.log -v ./resources/error.log:/var/log/nginx/error.log -v ./resources/:/var/profile/ -v ./src/:/www/profile/ localhost/profile:latest
