# Update the system packages 
sudo apt-get update -y 
# Install required software properties package 
sudo apt-get install -y software-properties-common 
# Add the Ansible PPA (Personal Package Archive) 
sudo add-apt-repository --yes --update ppa:ansible/ansible 
# Update the system packages again to include the new repository 
sudo apt-get update -y 
# Install Ansible 
sudo apt-get install -y ansible 
# Verify the installation by checking Ansible version 
ansible --version