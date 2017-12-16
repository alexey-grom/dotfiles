#!/usr/bin/env bash

BUILD_PATH=$(pwd)/tmp/livecd
#rm -rf ${BUILD_PATH}

sudo ansible-playbook -i "${BUILD_PATH}," playbooks/livecd.yml
#rm -rf ${BUILD_PATH}
