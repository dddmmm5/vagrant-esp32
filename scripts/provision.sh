#!/usr/bin/env bash
echo "Update OS..."
apt-get update
apt-get upgrade -y
apt-get install -y wget

echo "Install dependencies..."
apt-get install -y git wget make libncurses-dev flex bison gperf python python-serial unzip
cp /vagrant/resources/ubuntu/locale.sh /etc/profile.d/locale.sh
