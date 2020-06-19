#!/bin/bash
set -e
sleep 5
mkdir -p /opt/sandbox/iroha-config
while [[ ! -d /root/client && ! -f /opt/sandbox/iroha-config/__init__.py ]]; do
  sleep 1
done
mv /opt/sandbox/iroha-config/__init__.py /root/client
systemctl restart docker
pushd /opt/sandbox/iroha-config
docker-compose up -d
pip3.7 install iroha
touch /tmp/bootstrap-done
