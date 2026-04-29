sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind create cluster --name sahil-cluster
kubectl get nodes
docker pull sahil733/app:2
kind load docker-image sahil733/app:2 --name sahil-cluster
kubectl apply -f deployment.yaml
kubectl apply -f service.yml
kubectl apply -f hpa.yml