#!/bin/sh

adduser -D $FTP_USER_USERNAME && echo -n "$FTP_USER_USERNAME:$FTP_USER_PASSWORD" | chpasswd;

delgroup $CONTAINER_SHARED_GROUP 2>>/dev/null;
addgroup -S -g 1001 $CONTAINER_SHARED_GROUP;

adduser $FTP_USER_USERNAME $CONTAINER_SHARED_GROUP;

echo $FTP_USER_USERNAME > /etc/vsftpd/user_list;

/usr/sbin/vsftpd /etc/vsftpd.conf