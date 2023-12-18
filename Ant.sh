#!/bin/bash

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "Java is required but not installed. Please install Java first."
    exit 1
fi

# Download and install Apache Ant
echo "Downloading Apache Ant..."
wget -q https://downloads.apache.org/ant/binaries/apache-ant-1.10.12-bin.tar.gz

# Verify the integrity of the downloaded file (optional but recommended)
wget -q https://downloads.apache.org/ant/binaries/apache-ant-1.10.12-bin.tar.gz.asc
wget -q https://downloads.apache.org/ant/KEYS
gpg --import KEYS
gpg --verify apache-ant-1.10.12-bin.tar.gz.asc apache-ant-1.10.12-bin.tar.gz

# Extract the archive
echo "Extracting Apache Ant..."
tar -xf apache-ant-1.10.12-bin.tar.gz

# Move Ant to /opt and create a symbolic link
sudo mv apache-ant-1.10.12 /opt
sudo ln -s /opt/apache-ant-1.10.12 /opt/ant

# Set environment variables
echo "export ANT_HOME=/opt/ant" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANT_HOME/bin" >> ~/.bashrc

# Load the new environment variables
source ~/.bashrc

# Display Ant version
echo "Apache Ant installed successfully. Version:"
ant -version

# Clean up downloaded files
rm apache-ant-1.10.12-bin.tar.gz apache-ant-1.10.12-bin.tar.gz.asc KEYS
