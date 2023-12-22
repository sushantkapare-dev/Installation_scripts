#!/bin/bash

# Define variables
RELIC_VERSION="2.0.0"  # Replace this with the desired version
INSTALL_DIR="/opt/relic"

# Ensure you have necessary dependencies installed (this may vary)
sudo apt-get update
sudo apt-get install -y build-essential

# Download Relic
wget https://github.com/relic-toolkit/relic/archive/${RELIC_VERSION}.tar.gz
tar -xzf ${RELIC_VERSION}.tar.gz
cd relic-${RELIC_VERSION}

# Configure and install Relic
make
sudo make install PREFIX=${INSTALL_DIR}

# Clean up
cd ..
rm -rf relic-${RELIC_VERSION}
rm ${RELIC_VERSION}.tar.gz
