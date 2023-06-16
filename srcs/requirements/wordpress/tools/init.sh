#!/bin/sh

cd ${WORDPRESS_PATH_DIRECTORY}

if [ ! -f wp-config.php ]; then
wp config create --dbname=${MARIADB_DB_NAME} \
                 --dbuser=${MARIADB_ADMIN_USERNAME} \
                 --dbpass=${MARIADB_ADMIN_PASSWORD} \
                 --dbhost=mariadb:3306 2>> error.log;

wp core install --url=${WORDPRESS_HTTPS_URL} \
                --title=${WORDPRESS_SITE_TITLE} \
                --admin_user=${WORDPRESS_ADMIN_USERNAME} \
                --admin_password=${WORDPRESS_ADMIN_PASSWORD} \
                --admin_email=${WORDPRESS_ADMIN_EMAIL} 2>> error.log;

wp user create	${WORDPRESS_BASE_USER_USERNAME} \
                ${WORDPRESS_BASE_USER_EMAIL} \
			    --user_pass=${WORDPRESS_BASE_USER_PASSWORD} \
			    --role=author 2>> error.log;

echo "define('WP_REDIS_HOST', 'redis');" >> wp-config.php

wp option update permalink_structure '/%postname%/';

wp plugin install redis-cache --activate;

fi

exec php-fpm7 -F;