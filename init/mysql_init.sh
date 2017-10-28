#!/bin/bash

#hosts
umount /etc/hosts
cat > /etc/hosts <<EOF
127.0.0.1 localhost
EOF
echo 'set host successfully'
echo 'mysql root passwod:'
echo `cat /var/log/mysqld.log | grep password |grep localhost:|awk -F ": " '{print $2}'`
