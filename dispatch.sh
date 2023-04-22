echo -e "\e[35m>>>>>>>>> Install Golang <<<<<<<<\e[0m"
yum install golang -y
useradd roboshop
mkdir /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app
unzip /tmp/dispatch.zip
go mod init dispatch
go get
go build
cp /root/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch