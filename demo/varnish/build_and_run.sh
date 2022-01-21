#!/bin/bash

docker build -t my-varnish .
docker run -d --name my-varnish -e VARNISH_SIZE=2G --tmpfs /var/lib/varnish:exec my-varnish 

# Additional configuration

#Add cache space
#-e VARNISH_SIZE=2G varnish

#Get all possible parameter to apply with -p param=value (Ex -p default_keep=300)
#docker run varnish varnishd -x parameter