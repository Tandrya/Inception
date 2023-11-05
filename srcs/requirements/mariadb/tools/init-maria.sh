cat .setup 2> /dev/null
if [ $? -ne 0 ]; then
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat init-db.sql)\"" | mariadb
	touch .setup
fi
usr/bin/mysqld_safe --datadir=/var/lib/mysql
# mysql -u root -p
# SHOW DATABASES;
# use 'wordpress';
# SHOW TABLES;
# SELECT wp_users.display_name FROM wp_users;
# SELECT *  FROM wp_users;