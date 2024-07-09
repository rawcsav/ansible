#!/bin/bash

# Load environment variables from .env file
set -o allexport
source "$(dirname "${BASH_SOURCE[0]}")/../.env"
set -o allexport

# Generate inventory file
cat <<EOL > $(dirname "${BASH_SOURCE[0]}")/../inventory.ini
[servers]
rawcsec ansible_host=$ANSIBLE_HOST_1 ansible_port=$ANSIBLE_PORT_1 ansible_user=$ANSIBLE_USER_1 ansible_become=yes ansible_become_method=sudo
rawcsav ansible_host=$ANSIBLE_HOST_2 ansible_port=$ANSIBLE_PORT_2 ansible_user=$ANSIBLE_USER_2 ansible_become=yes ansible_become_method=sudo

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOL
