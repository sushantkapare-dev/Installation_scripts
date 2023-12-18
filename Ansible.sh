# Step 1 — Installing Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

# Step 2 — Setting Up the Inventory File
sudo nano /etc/ansible/hosts

[servers]
server1 ansible_host=203.0.113.111
server2 ansible_host=203.0.113.112
server3 ansible_host=203.0.113.113

[all:vars]
ansible_python_interpreter=/usr/bin/python3

# Whenever you want to check your inventory, you can run:
ansible-inventory --list -y

# Step 3 — Testing Connection
ansible all -m ping -u root

# Step 4 — Running Ad-Hoc Commands 
ansible all -a "df -h" -u root
ansible all -m apt -a "name=vim state=latest" -u root
ansible servers -a "uptime" -u root
ansible server1:server2 -m ping -u root
