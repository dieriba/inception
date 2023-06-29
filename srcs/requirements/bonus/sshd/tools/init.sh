#!/bin/sh

adduser -D $SSHD_USERNAME && echo -n "$SSHD_USERNAME:$SSHD_PASSWORD" | chpasswd;

delgroup $CONTAINER_SHARED_GROUP 2>>/dev/null;

addgroup -S -g 1001 $CONTAINER_SHARED_GROUP;

adduser $SSHD_USERNAME $CONTAINER_SHARED_GROUP;

/usr/sbin/sshd -D