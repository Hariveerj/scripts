# Step 1: Update package index 
sudo apt update 
# Step 2: Install Docker using docker.io from Ubuntu's repositories 
sudo apt install -y docker.io 
# Step 3: Start Docker and enable it to start on boot 
sudo systemctl start docker 
sudo systemctl enable docker 
# Step 4: Verify Docker installation by checking Docker version 
sudo docker --version 