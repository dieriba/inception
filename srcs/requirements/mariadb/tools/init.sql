CREATE USER ${ADMIN_USERNAME}@'localhost' IDENTIFIED BY ${ADMIN_PASSWORD};
GRANT ALL PRIVILEGES ON ${MARIADB_DB_NAME}.* TO ${ADMIN_USERNAME}@'localhost' IDENTIFIED BY ${ADMIN_PASSWORD};
ALTER USER 'root'@'localhost' IDENTIFIED BY ${ROOT_PASSWORD};
FLUSH PRIVILEGES;

CREATE DATABASE wordpress;