#!/bin/bash

# Define Gradle version
GRADLE_VERSION="7.3"

# Define installation directory
INSTALL_DIR="/opt/gradle"

# Download and extract Gradle
wget -nc "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -P /tmp
sudo mkdir -p ${INSTALL_DIR}
sudo unzip -q /tmp/gradle-${GRADLE_VERSION}-bin.zip -d ${INSTALL_DIR}

# Set up environment variables
echo "export GRADLE_HOME=${INSTALL_DIR}/gradle-${GRADLE_VERSION}" >> ~/.bashrc
echo "export PATH=\${GRADLE_HOME}/bin:\${PATH}" >> ~/.bashrc

# Reload the shell to apply changes
source ~/.bashrc

# Verify the installation
gradle -v

# Clean up
rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

echo "Gradle ${GRADLE_VERSION} has been successfully installed."
