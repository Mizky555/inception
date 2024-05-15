FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip mariadb-server mariadb-client
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY tools/init.sh /usr/local/bin/.

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/init.sh" ]

# CMD ["mysqld", "--bind-address=0.0.0.0", "-uroot"]
CMD [ "/usr/bin/mysqld_safe" ]
