#!/bin/bash

echo "Обновляем APT и устанавливаем Ruby и Bundler..."

sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install ruby-full ruby-bundler build-essential

echo "Добавляем ключи и репозиторий MongoDB ..."
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "Обновим индекс доступных пакетов ..."
sudo apt-get --assume-yes update
#apt-get --assume-yes upgrade


echo "Установка MongoDB ..."
sudo apt-get --assume-yes install mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

dir=~/
echo "Копируем код приложения"
git clone -b monolith https://github.com/express42/reddit.git
echo "Устанавливаем зависимости приложения"
cd reddit && bundle install
puma -d
echo "...complete."


