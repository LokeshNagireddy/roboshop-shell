echo -e "\e[35m>>>>>>>>> Disable Existing mysql version  <<<<<<<<\e[0m"
dnf module disable mysql -y
echo -e "\e[35m>>>>>>>>> Create mysql repo file  <<<<<<<<\e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo
echo -e "\e[35m>>>>>>>>> install mysql  <<<<<<<<\e[0m"
yum install mysql-community-server -y
echo -e "\e[35m>>>>>>>>> Enable & Start mysql service  <<<<<<<<\e[0m"
systemctl enable mysqld
systemctl start mysqld
echo -e "\e[35m>>>>>>>>> Update credentials  <<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1
mysql -uroot -pRoboShop@1