#!/bin/sh
sudo apt-get update
sudo apt install -y mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb
echo "mongod installed"
