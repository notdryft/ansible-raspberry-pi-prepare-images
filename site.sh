#!/bin/sh

set -x

ansible-playbook -c ssh -i hosts -k -s site.yml
sed '/localhost/d' ~/.ssh/known_hosts > known_hosts
chmod 600 known_hosts
mv known_hosts ~/.ssh/known_hosts
