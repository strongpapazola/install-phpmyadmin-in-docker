# install-phpmyadmin-in-docker

<pre>
apt update
apt install mariadb-server -y
echo "[mysqld]" >> /etc/mysql/my.cnf
echo 'bind-address = "172.17.0.1"' >> /etc/mysql/my.cnf
service mysql restart
docker run -d --restart always --name phpmyadmin -e PMA_HOST=172.17.0.1 -e PMA_PORT=3306 -p 8000:80 phpmyadmin
</pre>

# Enable login as user %

```
UPDATE mysql.user SET plugin = 'mysql_native_password', authentication_string = PASSWORD('pass123') WHERE User = 'root';
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='root';
FLUSH PRIVILEGES;

