echo -e "\e[35m>>>>>>>>> Download NodeJs <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[35m>>>>>>>>> Install NodeJs <<<<<<<<\e[0m"
yum install nodejs -y
echo -e "\e[35m>>>>>>>>> Create User roboshop <<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[35m>>>>>>>>> Download catalogue module <<<<<<<<\e[0m"
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip

echo -e "\e[35m>>>>>>>>> Update Dependencies <<<<<<<<\e[0m"
npm install

echo -e "\e[35m>>>>>>>>> Create and start Catalogue service <<<<<<<<\e[0m"
cp catalogue.service /etc/systemd/system/catalogue.service
systemctl enable catalogue
systemctl start catalogue

echo -e "\e[35m>>>>>>>>> Create Mongodb repo file <<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/

echo -e "\e[35m>>>>>>>>> Install Mongodb <<<<<<<<\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[35m>>>>>>>>> Update Mongodb schema <<<<<<<<\e[0m"
mongo --host mongodb-dev.lokeshnagireddy.online </app/schema/catalogue.js