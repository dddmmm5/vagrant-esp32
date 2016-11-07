#!/bin/bash
source "/vagrant/scripts/common.sh"

function install {
        cd ${DEV_HOME}
        git clone https://github.com/espressif/esp-idf-template.git myapp 
        chown -R ${USER}:${USER} ${DEV_HOME}/myapp
}

echo "Setup example project"
install

