echo -e "\e[35m>>>>>>>>> Download and install Redis  <<<<<<<<\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
dnf module enable redis:remi-6.2 -y
yum install redis -y
echo -e "\e[35m>>>>>>>>> Update Listener address  <<<<<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0' /etc/redis.conf
sed -i -e 's|127.0.0.1|0.0.0.0' /etc/redis/redis.conf

echo -e "\e[35m>>>>>>>>> Enable and Start Redis Service  <<<<<<<<\e[0m"
systemctl enable redis
systemctl start redis