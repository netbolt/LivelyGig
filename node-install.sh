#!/bin/bash

# masternodes@yahoo.com
# Synereo node install
# Run command as root at login (Use sudo if you login as user)
# curl -s https://raw.githubusercontent.com/netbolt/synereo-node/master/node-install.sh | bash /dev/stdin

# Set docker-compose version
VERSION_NUM=1.6.0

# Install kernel extra's to enable docker aufs support
apt-get -y install linux-image-extra-$(uname -r)

# Add Docker PPA and install latest version
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
apt-get update
apt-get install lxc-docker -y

# Install docker-compose
sh -c "curl -L https://github.com/docker/compose/releases/download/$VERSION_NUM/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
chmod +x /usr/local/bin/docker-compose
sh -c "curl -L https://raw.githubusercontent.com/docker/compose/$VERSION_NUM/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

# Install docker-compose.yml (Compose file reference)
mkdir my-node
curl -o my-node/docker-compose.yml https://raw.githubusercontent.com/netbolt/docker-compose/master/docker-compose.yml
chmod u+x my-node/docker-compose.yml
