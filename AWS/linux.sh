#!/bin/bash
set -ex
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo yum install -y python3-pip
sudo service docker start
sudo chkconfig docker on
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cat <<EOF >/home/ec2-user/docker-compose.yml
version: '3'

services:
    mysql: 
        image: mysql:5.7
        container_name: mysql_container
        environment:
            MYSQL_ROOT_PASSWORD: my_secrer_password
            MYSQL_DATABASE: app_db
            MYSQL_USER: db_user
            MYSQL_PASSWORD: db_user_pass
        ports:
            - "3306:3306"
        expose: 
            - '3306'
        volumes:
            - dbdata:/var/lib/mysql
            
    postgres:
        container_name: postgres_container
        image: postgres:13.11
        environment:
            POSTGRES_DATABASE: app_db
            POSTGRES_USER: db_user
            POSTGRES_PASSWORD: db_user_pass
        volumes:
            - dbdata:/data/postgres
        ports:
            - "5432:5432"
        expose:
            - "5432"

    dbeaver:
        image: dbeaver/cloudbeaver:latest
        container_name: dbeaver
        restart: always
        ports:
            - "8080:8978"
        volumes:
            - cloudbeaver:/opt/cloudbeaver/workspace
volumes:
    cloudbeaver:
    dbdata:
EOF

chown ec2-user:ec2-user /home/ec2-user/docker-compose.yml
/usr/local/bin/docker-compose -f /home/ec2-user/docker-compose.yml up -d