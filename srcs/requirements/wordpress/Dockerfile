FROM	alpine:3.17
RUN		apk update
RUN		apk add --no-cache --update curl bash vim
RUN		apk add --no-cache --update mariadb-client
RUN		apk add --no-cache --update php php-phar php-json php-curl php-fpm php-mysqli php-iconv
RUN		mkdir -p /var/www/wordpress
RUN		mkdir -p /var/www/wordpress/config
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp 
RUN		chmod +x ./usr/bin/wp 
RUN		wp core download --path=/var/www/wordpress
WORKDIR /var/www/wordpress
COPY	/config/wp-config /config/wp-config
COPY	/config/www.conf /config/www.conf
COPY	./tools/init-wp.sh /tmp/init-wp.sh
RUN		chmod +x /tmp/init-wp.sh
ENTRYPOINT ["sh", "/tmp/init-wp.sh"]