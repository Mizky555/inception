FROM debian:bullseye-slim

RUN apt update && apt upgrade -y && apt install -y nginx openssl && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/mycert.crt -keyout /etc/nginx/ssl/mykey.key -subj "/C=TH/ST=Bangkok/L=Yannawa/O=42Bkk/OU=student/CN=tsirirak/emailAddress=65420128@kmitl.ac.th"
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
