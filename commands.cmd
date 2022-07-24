podman build -f .\Containerfile -t profile

podman stop -a

podman exec -it a708722e43bda38ea0739468fc80b6356e7e5ad0ac8dfde39eea2340c0c639af /usr/sbin/nginx -s reload

podman run -p 8080:80 --name profile --restart unless-stopped --replace --tls-verify -d -v nginx.conf:/etc/nginx/nginx.conf -v ./resources/access.log:/var/log/nginx/access.log -v ./resources/error.log:/var/log/nginx/error.log -v ./resources/:/var/profile/ localhost/profile:latest
