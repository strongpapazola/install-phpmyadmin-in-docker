#!/bin/bash
apt update
apt install mariadb-server -y
echo "[mysqld]" >> /etc/mysql/my.cnf
echo 'bind-address = "172.17.0.1"' >> /etc/mysql/my.cnf
service mysql restart
docker run -d --restart always --name phpmyadmin -e PMA_HOST=172.17.0.1 -e PMA_PORT=3306 -p 8000:80 phpmyadmin
