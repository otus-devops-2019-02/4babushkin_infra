#!/bin/bash
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "Обновим индекс доступных пакетов ..."
apt-get update
apt-get -y install mongodb-org
systemctl enable mongod
echo "...complete."

