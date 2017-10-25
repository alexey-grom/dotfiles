#!/usr/bin/env bash

ansible-playbook -i update-home.inventory.ini playbooks/update-home.yml --tags="${@:-all}"
