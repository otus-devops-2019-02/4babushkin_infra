#!/bin/bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script-url=https://gist.githubusercontent.com/4babushkin/61b7790b24f2580e3c5dd53d11548a17/raw/23914173d002d606e195eb7ebd6951b5d12583a3/startup_script.sh

