echo -e "\e[35m>>>>>>>>> Download and Install NodeJS  <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
echo -e "\e[35m>>>>>>>>> Create User  <<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[35m>>>>>>>>> Download User Module  <<<<<<<<\e[0m"
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cd /app
echo -e "\e[35m>>>>>>>>> install dependencies  <<<<<<<<\e[0m"
npm install

echo -e "\e[35m>>>>>>>>> Copy User Service  <<<<<<<<\e[0m"
cp user.service /etc/systemd/system/user.service
systemctl daemon-reload

echo -e "\e[35m>>>>>>>>> Enable and Starte User Service  <<<<<<<<\e[0m"
systemctl enable user
systemctl start user

echo -e "\e[35m>>>>>>>>> Create mongodb repo file  <<<<<<<<\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[35m>>>>>>>>> Install Mongodb  <<<<<<<<\e[0m"
yum install mongodb-org-shell -y
echo -e "\e[35m>>>>>>>>> Update Mongodb Schema  <<<<<<<<\e[0m"
mongo --host mongodb-dev.lokeshnagireddy.online </app/schema/user.js