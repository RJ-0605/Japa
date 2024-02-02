#!/bin/bash

ansible-playbook -i inventory.ini setup_server.yml --private-key=../../../../../jed_awintech_keypair.pem
ansible-playbook -i inventory.ini install_java.yml
ansible-playbook -i inventory.ini install_jenkins.yml
ansible-playbook -i inventory.ini install_plugins.yml

