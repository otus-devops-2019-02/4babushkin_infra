#!/bin/bash
echo "Обновляем APT и устанавливаем Ruby и Bundler..."
apt-get update
apt-get -y install ruby-full ruby-bundler build-essential
echo "...complete."
