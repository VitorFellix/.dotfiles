#!/bin/bash

# Uncomment and change the distribution name if you are not using CentOS/RHEL/Fedora
# DISTRIBUTION_NAME=centos

# this checks if the command log is in the path of the user running this script
if ! command -v log >/dev/null 2>&1; then
	log() {
		echo -e "\t$(date "+%y-%m-%d %H:%M:%S") [INFO] $1"
	}
fi

help() {
	log "use this format to install a jdk and jre."
	log "options: \$ $0 <version> <set-default>"
	log "for example: \$ $0 8 true"
	exit 1
}

if [[ $1 == "--help" ]]; then
	help
fi

if [[ $# -lt 1 ]]; then
	log "less than one parameter specified, please provide the version to be installed."
	exit 1
fi

if [[ $# -gt 2 ]]; then
	log "more than one parameter specified, please provide only the version."
	exit 1
fi

VERSION=$1

log "installing - version $VERSION and setting as default"

if [[ ! -e /etc/yum.repos.d/adoptium.repo ]]; then
	log "installing - repository for adoptium"
	cat <<EOF >/etc/yum.repos.d/adoptium.repo
[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/${DISTRIBUTION_NAME:-$(
		. /etc/os-release
		echo $ID
	)}/\$releasever/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public
EOF
fi

log "installing - jdk version $VERSION"
sudo dnf install -y temurin-$VERSION-jdk
log "installing - jre version $VERSION"
sudo dnf install -y temurin-$VERSION-jre

log "configuring - default java to JDK $VERSION"
sudo /usr/sbin/alternatives --install /usr/bin/java java /usr/lib/jvm/temurin-$VERSION-jdk/bin/java 21000
sudo /usr/sbin/alternatives --install /usr/bin/javac javac /usr/lib/jvm/temurin-$VERSION-jdk/bin/javac 21000
sudo /usr/sbin/alternatives --set java /usr/lib/jvm/temurin-$VERSION-jdk/bin/java
sudo /usr/sbin/alternatives --set javac /usr/lib/jvm/temurin-$VERSION-jdk/bin/javac

log "setting JAVA_HOME in /etc/profile.d/java.sh"
sudo tee /etc/profile.d/java.sh >/dev/null <<EOF
export JAVA_HOME=/usr/lib/jvm/temurin-$VERSION-jdk
export PATH=\$JAVA_HOME/bin:\$PATH
EOF
sudo chmod +x /etc/profile.d/java.sh

# log "printing - alternatives list for java"
# alternatives --list | grep java

# log "updating alternatives"
# sudo update-alternatives --config java

log "printing - java version"
java --version
log "printing - which java"
which java
log "printing - /usr/lib/jvm path"
ls -l /usr/lib/jvm/

log "please run the following command:"
log "\$ source /etc/profile.d/java.sh"

log "done"
