#!/bin/bash

set -ouex pipefail

dnf install -y ansible-core firewalld cockpit cifs-utils && \
    ansible-galaxy collection install -r /var/opt/ansible/requirements.yml && \
    ansible-playbook /var/opt/ansible/configure-firewall-playbook.yml

# Enable services
systemctl enable cockpit.socket
systemctl enable var-mnt-containers_data.automount
systemctl enable podman.socket
