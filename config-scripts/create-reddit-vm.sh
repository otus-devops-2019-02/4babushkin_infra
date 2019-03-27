#!/bin/bash
gcloud compute instances create reddit-full \
  --image=reddit-full-1553653135 \
  --tags puma-server \
  --restart-on-failure \
  --machine-type=f1-micro \
 
#gcloud compute instances create reddit-base\
#  --image=reddit-base-1553575349 \
#  --tags puma-server \
#  --restart-on-failure \

