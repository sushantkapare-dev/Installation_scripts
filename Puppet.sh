
#!/bin/bash

# Add Puppet repository
sudo apt-get update
sudo apt-get install -y ca-certificates
sudo wget https://apt.puppet.com/puppet7-release-bionic.deb
sudo dpkg -i puppet7-release-bionic.deb
sudo apt-get update

# Install Puppet
sudo apt-get install -y puppet-agent

# Verify installation
sudo /opt/puppetlabs/bin/puppet --version
