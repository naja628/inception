FROM debian:bullseye

RUN apt update && apt install nginx -y
RUN apt install openssl -y

RUN rm -rf /etc/nginx
COPY conf /etc/nginx

# Generate certificate and key
# req = certificate request and certificate generating utility.
# It can additionally create self signed certificates for use as root CAs for example.
# -x509 = self signed
# -nodes = if this option is specified then if a private key is created it will not be encrypted.
# -keyout = where to write the key
# -subj = info for ssl key Country,State,...
RUN mkdir /etc/nginx/certs && openssl req -x509 -nodes \
	-out /etc/nginx/certs/cert.crt \
	-keyout /etc/nginx/certs/key.key \
	-subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=najacque.42.fr"

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
