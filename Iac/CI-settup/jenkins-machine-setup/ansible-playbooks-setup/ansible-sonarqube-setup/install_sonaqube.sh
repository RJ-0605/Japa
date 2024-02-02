#!/bin/bash

ansible-playbook -i inventory.ini sonar_complete_setup.yml --private-key=../jed_awintech_keypair.pem

