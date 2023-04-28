#!/bin/sh
sudo apt-get update
sudo apt install -y mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
echo "mongod installed"
