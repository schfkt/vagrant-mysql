apt-get update
DEBIAN_FRONTEND='noninteractive' apt-get install -q -y mysql-server mysql-client

sed -i "s/bind-address.*=.*/bind-address=0.0.0.0/" /etc/mysql/my.cnf
mysqladmin -u root password root
mysql --user=root --password=root mysql -e "GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'root'; FLUSH PRIVILEGES;"
service mysql restart
