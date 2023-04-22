echo -e "\e[35m>>>>>>>>> Install Python  <<<<<<<<\e[0m"
yum install python36 gcc python3-devel -y
echo -e "\e[35m>>>>>>>>> Create User  <<<<<<<<\e[0m"
useradd roboshop

echo -e "\e[35m>>>>>>>>> Download payment module  <<<<<<<<\e[0m"
mkdir /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip

echo -e "\e[35m>>>>>>>>> Install Dependencies  <<<<<<<<\e[0m"
pip3.6 install -r requirements.txt

echo -e "\e[35m>>>>>>>>> Copy payment service  <<<<<<<<\e[0m"
cp payment.service /etc/systemd/system/payment.service
systemctl daemon-reload
echo -e "\e[35m>>>>>>>>> Enable and Start Payment Service  <<<<<<<<\e[0m"
systemctl enable payment
systemctl start payment