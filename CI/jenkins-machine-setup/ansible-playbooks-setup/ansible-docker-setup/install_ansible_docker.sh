#!/bin/bash

ansible-playbook -i inventory.ini install-docker.yaml --private-key=../../../../../jed_awintech_keypair.pem


