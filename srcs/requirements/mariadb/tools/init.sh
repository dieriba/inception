#!/bin/sh

mkdir mdr;

mysql -u root < ./init.sql > lol

exec mysqld_safe;