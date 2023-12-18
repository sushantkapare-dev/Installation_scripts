# Prerequisites
# Ubuntu Server with 20.04/18.04/16.04 LTS
# Java 8 or higher version
# 2 CPU and 4 GB RAM
# Open Ports 9200

# Update the system packages
sudo apt update

# Install the apt-transport-https package to access repository over HTTPS
 sudo apt install apt-transport-https

#  Lets install OpenJDK 11 on ubuntu  using below commands.
 sudo apt install openjdk-11-jdk

#  To define the environment variable open the below file:
sudo nano /etc/environment

# Paste the below variable into the file:
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

# Load the environment variable using below command
source /etc/environment

# Lets verify JAVA_HOME variable
echo $JAVA_HOME

# Download and install the public signing key, If you want download latest Elasticsearch then visit Elastic Stack Official download page.
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Save the repository definition to /etc/apt/sources.list.d/elastic-8.x.list:
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list

# You can install the Elasticsearch using below command:
sudo apt-get update
sudo apt-get install elasticsearch

# Start elacticsearch services
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl status elasticsearch

# Let’s make changes in below configuration file
sudo nano /etc/elasticsearch/elasticsearch.yml

# Go to Network section and uncomment network.host and replace your system IP with
network.host: 0.0.0.0
discovery.seed_hosts: [ ]
xpack.security.enabled: false

# After changing in configuration file you need to restart so run the below command:
sudo systemctl restart elasticsearch

# Lets test Elasticsearch using curl command by sending HTTP request
curl -X GET "localhost:9200"

# You can access using browser
http://systemIp:9200

# If you wants to uninstall elasticsearch then you run the below commands:
sudo apt-get --purge autoremove elasticsearch
sudo apt-get remove --purge elasticsearch
sudo rm -rf /etc/elasticsearch



