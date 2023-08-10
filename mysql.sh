script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
mysql_root_password=$1

if [ -z "$mysql_root_password" ]; then
  echo Input MySQL Root Password Missing
  exit 1
fi

echo -e "\e[35m>>>>>>>>> Disable Existing mysql version  <<<<<<<<\e[0m"
dnf module disable mysql -y
echo -e "\e[35m>>>>>>>>> Create mysql repo file  <<<<<<<<\e[0m"
cp ${script_path}/mysql.repo /etc/yum.repos.d/mysql.repo
echo -e "\e[35m>>>>>>>>> install mysql  <<<<<<<<\e[0m"
yum install mysql-community-server -y
echo -e "\e[35m>>>>>>>>> Enable & Start mysql service  <<<<<<<<\e[0m"
systemctl enable mysqld
systemctl restart mysqld
echo -e "\e[35m>>>>>>>>> Update credentials  <<<<<<<<\e[0m"
mysql_secure_installation --set-root-pass $mysql_root_password
#mysql -uroot -pRoboShop@1