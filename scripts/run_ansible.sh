#!/bin/bash

# Determine the base directory of the script
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Generate the inventory file
"$BASE_DIR/scripts/inventory.sh"

# Change to the base directory
cd "$BASE_DIR"

# Run the first Ansible playbook
ansible-playbook playbooks/update.yml

# Run the second Ansible playbook
ansible-playbook playbooks/docker.yml
