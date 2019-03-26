#!/bin/bash
gcloud compute instances create reddit-base\
  --image=reddit-base-1553575349 \
  --tags puma-server \
  --restart-on-failure \
 

