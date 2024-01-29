#!/bin/bash


tar -cvzf jenkins-machine-setup.tar.gz jenkins-machine-setup

scp -i jed_awintech_keypair.pem  jenkins-machine-setup.tar.gz ubuntu@3.144.10.177:~/