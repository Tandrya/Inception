FROM	alpine:3.17
RUN		apk update
RUN		apk add --no-cache --update mariadb mariadb-client
RUN 	mkdir -p /var/lib/mysqld /run/mysqld
COPY	./config/init-db.sql ./
COPY	./tools/init-maria.sh ./
COPY 	./config/mariadb-server.cnf /etc/my.cnf.d/
RUN 	chmod +x ./init-maria.sh
RUN		mariadb-install-db --datadir=/var/lib/mysql \
			--auth-root-authentication-method=normal
RUN		chown -R mysql:mysql /var/lib/mysql
RUN 	chown -R mysql:mysql /run/mysqld
ENTRYPOINT [ "sh", "init-maria.sh" ]