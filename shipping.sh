echo -e "\e[35m>>>>>>>>> Install Maven  <<<<<<<<\e[0m"
yum install maven -y
echo -e "\e[35m>>>>>>>>> Create User  <<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[35m>>>>>>>>> Download Shipping module  <<<<<<<<\e[0m"
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
mvn clean package
mv target/shipping-1.0.jar shipping.jar

echo -e "\e[35m>>>>>>>>> Copy Shipping service  <<<<<<<<\e[0m"
cp shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
echo -e "\e[35m>>>>>>>>> Enable and Start Shipping Service  <<<<<<<<\e[0m"
systemctl enable shipping
systemctl start shipping

echo -e "\e[35m>>>>>>>>> Install mysql and Load mysql schema  <<<<<<<<\e[0m"
yum install mysql -y
mysql -h mysql-dev.lokeshnagireddy.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping