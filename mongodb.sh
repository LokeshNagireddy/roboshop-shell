yum install mongodb-org -y

systemctl enable mongod
systemctl start mongod
#change the listen address from 127.0.0.1 to 0.0.0.0 in mongod.conf

systemctl restart mongod