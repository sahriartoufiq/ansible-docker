#!/bin/bash

ssh-keygen -t rsa -b 2048 -C "your_email@example.com" -f ansible_keys -N ""

docker build -t centos-ssh2 .
docker run -d --name centos-ssh-container2 centos-ssh2

container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' centos-ssh-container2)

echo "[tomcat-servers]" > inventory.ini
echo $container_ip >> inventory.ini
