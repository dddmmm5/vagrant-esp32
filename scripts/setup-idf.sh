#!/bin/bash
source "/vagrant/scripts/common.sh"

function setupEnvVars {
	echo "creating idf environment variables"
	cp -f ${IDF_RES_DIR}/esp32-idf.sh /etc/profile.d/esp32-idf.sh
}

function install {
        cd ${DEV_HOME}
        git clone --recursive https://github.com/espressif/esp-idf.git
        chown -R ${USER}:${USER} ${DEV_HOME}/esp-idf
}

echo "Setup Espressif IoT Development Framework"
install
setupEnvVars

