echo -e "\e[35m>>>>>>>>> Download and Install NodeJS  <<<<<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
echo -e "\e[35m>>>>>>>>> Create User  <<<<<<<<\e[0m"
useradd roboshop
echo -e "\e[35m>>>>>>>>> Download Cart Module  <<<<<<<<\e[0m"
mkdir /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
echo -e "\e[35m>>>>>>>>> Install Dependencies  <<<<<<<<\e[0m"
npm install
echo -e "\e[35m>>>>>>>>> Copy Cart Service  <<<<<<<<\e[0m"
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service
systemctl daemon-reload
echo -e "\e[35m>>>>>>>>> Enable and Start Cart Service  <<<<<<<<\e[0m"
systemctl enable cart
systemctl start cart