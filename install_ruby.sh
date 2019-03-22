#!/bin/bash
echo "Обновляем APT и устанавливаем Ruby и Bundler..."
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install ruby-full ruby-bundler build-essential
echo "...complete."