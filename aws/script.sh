#!/bin/bash

# wait until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done

apt-get update
apt-get -y install nginx

service nginx start