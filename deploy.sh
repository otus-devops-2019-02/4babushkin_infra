#!/bin/bash

dir=~/

echo "Копируем код приложения"

git clone -b monolith https://github.com/express42/reddit.git

echo "Устанавливаем зависимости приложения"

cd reddit && bundle install
puma -d

echo "...complete."

