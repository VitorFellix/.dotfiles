#!/bin/bash

VERSION="1.24.3"
TAR_FILE="go${VERSION}.linux-amd64.tar.gz"

echo "installing golang ${VERSION}"

sudo rm -rf /usr/local/go

if [[ ! -e "${TAR_FILE}" ]]; then
	echo "file "${TAR_FILE}" not found, downloading it"
	wget "https://go.dev/dl/${TAR_FILE}"
fi

sudo tar -C /usr/local -xzf "${TAR_FILE}"

echo 'please add /usr/local/go/bin to $PATH'
echo '$ export PATH=$PATH:/usr/local/go/bin'

rm "${TAR_FILE}"

go version
