# Update the system packages 
sudo apt-get update -y 
# Install required dependencies 
sudo apt-get install -y gnupg software-properties-common curl 
# Add the HashiCorp GPG key 
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o 
/usr/share/keyrings/hashicorp-archive-keyring.gpg 
# Add the HashiCorp repository to your system 
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] 
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee 
/etc/apt/sources.list.d/hashicorp.list 
# Update the system packages again to include the new repository 
sudo apt-get update -y 
# Install Terraform 
sudo apt-get install terraform -y 
# Verify the installation by checking Terraform version 
terraform –version