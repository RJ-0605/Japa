#!/bin/bash

ansible-playbook -i inventory.ini install_docker_compose.yml  --private-key=../../../../../jed_awintech_keypair.pem
ansible-playbook -i inventory.ini create_sonarqube_docker_network.yml
ansible-playbook -i inventory.ini run_sonarqube_docker_container.yml
