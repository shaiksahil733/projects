# Enterprise Multi-Cloud CI/CD Deployment Platform 🚀

## 📌 Project Overview

Built an end-to-end DevOps CI/CD platform that automates application build, containerization, image publishing, and Kubernetes deployment using GitHub, Azure DevOps, DockerHub, AWS EC2, and Kubernetes.

Whenever code is pushed to GitHub, the pipeline automatically builds a Docker image, pushes it to DockerHub, securely connects to AWS EC2 through SSH, and deploys the latest version to Kubernetes with rolling updates.

---

## 🏗️ Architecture Flow

```text
GitHub Push
↓
Azure DevOps Pipeline Trigger
↓
Docker Build
↓
DockerHub Push
↓
SSH to AWS EC2
↓
Kubernetes Deployment Update
↓
Rolling Update
↓
Live Application
```

---

## 🛠️ Tech Stack

- GitHub
- Azure DevOps Pipelines
- Docker
- DockerHub
- AWS EC2
- Kubernetes (KIND - Kubernetes IN Docker)
- Python Flask
- Linux
- YAML

---

## 📂 Project Structure

```text
├── app.py
├── requirements.txt
├── Dockerfile
├── deployment.yaml
├── service.yml
├── hpa.yml
├── azure-pipelines.yml
├── Terraform/
└── README.md
```

---

## ⚙️ Implemented Features

- Automated CI/CD pipeline using Azure DevOps YAML
- Docker image build and push to DockerHub
- Secure SSH deployment to AWS EC2
- Kubernetes rolling updates with zero downtime
- NodePort service exposure for browser access
- Version-based image tagging for rollback support

---

## 📈 Project Impact

- Reduced manual deployment effort by **90%**
- Deployment pipeline completed in **under 45 seconds**
- Achieved **zero downtime deployments**
- Managed **2 running replicas** in Kubernetes
- Integrated **5+ DevOps tools** in one workflow

---

## 📸 Screenshots

### Azure DevOps Pipeline Success
![Pipeline Success](enterprise-1.PNG)

### DockerHub Image Tags
![DockerHub Tags](enterprise-2.PNG)

### Kubernetes Pods Running
![Kubernetes Pods](enterprise-3.PNG)

### Live Application in Browser
![Live App](enterprise-4.PNG)

---

## 🌐 Live Output

```text
Welcome to Sahil DevOps App
Version 2.0
Rolling Update Successful
```

---

## 🔐 Security Used

- Azure DevOps Variable Groups
- Secure Files for SSH Key
- DockerHub Service Connection
- SSH Service Connection

---

## 🚀 Future Enhancements

- Prometheus Monitoring
- Grafana Dashboards
- Helm Charts
- Terraform Full Infra Automation
- ArgoCD GitOps Deployment

---

## 👨‍💻 Author

**Sahil Shaik**
