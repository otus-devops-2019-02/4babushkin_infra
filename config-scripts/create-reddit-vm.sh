#!/bin/bash
gcloud compute instances create reddit-full \
  --image=reddit-full-1553593980 \
  --tags puma-server \
  --restart-on-failure \
 
#gcloud compute instances create reddit-base\
#  --image=reddit-base-1553575349 \
#  --tags puma-server \
#  --restart-on-failure \

