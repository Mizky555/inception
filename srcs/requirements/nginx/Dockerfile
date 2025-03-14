FROM debian:bullseye-slim

RUN apt update
RUN apt upgrade -y
RUN apt install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mycert.crt -keyout /etc/nginx/ssl/mykey.key -subj "/C=TH/ST=Bangkok/L=Yannawa/O=42Bkk/OU=student/CN=tsirirak/emailAddress=65420128@kmitl.ac.th"
COPY ./conf/config_nginx.conf /etc/nginx/conf.d/config_nginx.conf
RUN rm -rf /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
