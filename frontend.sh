echo -e "\e[35m>>>>>>>>> Install nginx <<<<<<<<\e[0m"
yum install nginx -y

echo -e "\e[35m>>>>>>>>> Enable nginx <<<<<<<<\e[0m"
systemctl enable nginx
systemctl start nginx
rm -rf /usr/share/nginx/html/*

echo -e "\e[35m>>>>>>>>> Download FrontEnd Module <<<<<<<<\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35m>>>>>>>>> Create the service <<<<<<<<\e[0m"
cp roboshop.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx