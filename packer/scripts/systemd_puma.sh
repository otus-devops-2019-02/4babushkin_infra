#!/bin/bash
wget https://gist.githubusercontent.com/4babushkin/5ce800fb5ae191f34913cd9796167225/raw/ca72d50872b91f69641ba2a4165dbbb5ff4ec559/puma.service /etc/systemd/system/puma.service
#sudo systemctl start puma
systemctl daemon-reload
systemctl enable puma


