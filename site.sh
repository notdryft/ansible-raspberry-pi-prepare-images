#!/bin/sh

set -x

ansible-playbook -c ssh -i hosts -k -s site.yml
