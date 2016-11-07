USER="ubuntu"
USER_HOME="/home/${USER}"
DEV_HOME="${USER_HOME}/esp"

ESP32_TOOL_CHAIN="xtensa-esp32-elf-linux64-1.22.0-59.tar.gz"
ESP32_TOOLCHAIN_DL="https://dl.espressif.com/dl/${ESP32_TOOL_CHAIN}"
TOOLCHAIN_RES_DIR="/vagrant/resources/toolchain"
IDF_RES_DIR="/vagrant/resources/idf"

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
