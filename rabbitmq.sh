echo -e "\e[35m>>>>>>>>> Download and Install Erlang  <<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash
yum install erlang -y

echo -e "\e[35m>>>>>>>>> Download and Install Rabbitmq  <<<<<<<<\e[0m"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash
yum install rabbitmq-server -y

echo -e "\e[35m>>>>>>>>> Enable and Start RabbitMq server  <<<<<<<<\e[0m"
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

echo -e "\e[35m>>>>>>>>> Create user Roboshop  <<<<<<<<\e[0m"
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"