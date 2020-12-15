#!/bin/bash

CODES_VERSION="code code-insiders"

for CODE in ${CODES_VERSION}; do
		# Intellisense	
		${CODE} --install-extension visualstudioexptteam.vscodeintellicode

    # ESLint, Prettier
    ${CODE} --install-extension dbaeumer.vscode-eslint
    ${CODE} --install-extension esbenp.prettier-vscode

    # Shell
    ${CODE} --install-extension foxundermoon.shell-format
    ${CODE} --install-extension timonwong.shellcheck

    # Docker
    ${CODE} --install-extension ms-azuretools.vscode-docker
    ${CODE} --install-extension ms-vscode-remote.remote-containers

    # Git
    ${CODE} --install-extension donjayamanne.githistory
    ${CODE} --install-extension eamodio.gitlens

    # SQL
    ${CODE} --install-extension mtxr.sqltools
    ${CODE} --install-extension mtxr.sqltools-driver-sqlite

    # Icons and utilities
    ${CODE} --install-extension PKief.material-icon-theme
    ${CODE} --install-extension tomoki1207.pdf
    ${CODE} --install-extension GrapeCity.gc-excelviewer
    ${CODE} --install-extension redhat.vscode-xml

    # Liveshare
    ${CODE} --install-extension ms-vsliveshare.vsliveshare
    ${CODE} --install-extension ms-vsliveshare.vsliveshare-audio

    # Programming languages
    ${CODE} --install-extension golang.go
    ${CODE} --install-extension ms-vscode.cpptools
    ${CODE} --install-extension redhat.java
    ${CODE} --install-extension ms-vscode.powershell

    # Python
    ${CODE} --install-extension ms-python.python
    ${CODE} --install-extension ms-toolsai.jupyter
    ${CODE} --install-extension ms-python.vscode-pylance
done
