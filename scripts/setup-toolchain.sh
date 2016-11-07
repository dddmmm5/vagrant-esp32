#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocal {
	echo "install from local file"
	FILE=/vagrant/resources/${ESP32_TOOL_CHAIN}
        mkdir -p ${DEV_HOME}
	tar -xzf $FILE -C ${DEV_HOME}
}

function installRemote {
	echo "install from remote file"
	curl -o /vagrant/resources/${ESP32_TOOLCHAIN} -O -L ${ESP32_TOOLCHAIN_DL}
        mkdir -p ${DEV_HOME}
	tar -xzf /vagrant/resources/${ESP32_TOOLCHAIN} -C ${DEV_HOME}
}

function setupEnvVars {
	echo "creating tool chain environment variables"
	cp -f ${TOOLCHAIN_RES_DIR}/esp32-toolchain.sh /etc/profile.d/esp32-toolchain.sh
	cp -f ${IDF_RES_DIR}/esp32-idf.sh /etc/profile.d/esp32-idf.sh
}

function install {
	if resourceExists ${ESP32_TOOLCHAIN}; then
		installLocal
	else
		installRemote
	fi
        chown -R ${USER}:${USER} ${DEV_HOME}
}

echo "Setup tool chain"
install
setupEnvVars

