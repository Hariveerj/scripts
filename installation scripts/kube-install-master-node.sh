# Update and install dependencies 
sudo apt update && sudo apt upgrade -y 
sudo apt install -y apt-transport-https ca-certificates curl 
# Disable Swap 
sudo swapoff -a 
sudo sed -i '/ swap / s/^/#/' /etc/fstab 
# Enable IP forwarding and bridge netfilter 
sudo modprobe br_netfilter 
sudo tee /proc/sys/net/ipv4/ip_forward <<< 1 
sudo tee /proc/sys/net/bridge/bridge-nf-call-iptables <<< 1 
# Install Docker 
sudo apt install -y docker.io 
sudo systemctl enable docker 
sudo systemctl start docker 
# Add Kubernetes apt repository 
sudo curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o 
/usr/share/keyrings/kubernetes-archive-keyring.gpg 
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] 
https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list 
# Install kubeadm, kubelet, kubectl 
sudo apt update 
sudo apt install -y kubelet kubeadm kubectl 
sudo apt-mark hold kubelet kubeadm kubectl 
# Initialize Kubernetes master node 
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 
# Setup kubectl for the default user 
mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config 
# Install Flannel network plugin 
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube
f
 lannel.yml 
# Display kubeadm join command for worker nodes 
kubeadm token create --print-join-command 