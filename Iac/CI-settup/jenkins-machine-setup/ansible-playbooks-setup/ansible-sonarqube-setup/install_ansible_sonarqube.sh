#!/bin/bash

ansible-playbook -i inventory.ini install_docker_compose.yml
ansible-playbook -i inventory.ini create_sonarqube_docker_network.yml
ansible-playbook -i inventory.ini run_sonarqube_docker_container.yml
