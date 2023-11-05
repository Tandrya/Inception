mv /config/www.conf /etc/php81/php-fpm.d/www.conf

if [ ! -f "wp-config.php" ]; then
	sleep 5 
	mv /config/wp-config ./wp-config.php
	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" \
    	--admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
	wp plugin update --all
	wp theme install twentytwentythree --activate
	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD
fi

php-fpm81 --nodaemonize