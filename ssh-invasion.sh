#!/usr/bin/env bash

ansible-playbook -i ssh-invasion.inventory.ini playbooks/ssh-invasion.yml --tags="${@:-all}"
