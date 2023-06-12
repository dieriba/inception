#!/bin/sh

mysql -u root < ./init.sql

exec mysqld_safe;