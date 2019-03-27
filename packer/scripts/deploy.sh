#!/bin/bash
#echo $1
dir=~/
echo "Копируем код приложения"
git clone -b monolith https://github.com/express42/reddit.git
echo "Устанавливаем зависимости приложения"
cd reddit && bundle install
#puma -d

mv /home/$1/puma.service /etc/systemd/system/puma.service
#systemctl start puma
systemctl daemon-reload
systemctl enable puma
echo "...complete."

