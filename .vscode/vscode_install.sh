#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/.config/Code/User

rm "${VSCODE_SETTING_DIR}/setting.json"
ln -s "${SCRIPT_DIR}/setting.json" "${VSCODE_SETTING_DIR}/setting.json"

rm "${VSCODE_SETTING_DIR}/keybindings.json"
ln -s "${SCRIPT_DIR}/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat ${SCRIPT_DIR}/extensions | while read line
do
    code --install-extension $line
done

code --list-extensions > ${SCRIPT_DIR}/extensions
