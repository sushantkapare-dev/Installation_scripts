
![kind-windows](https://github.com/SushantOps/Installation_scripts/assets/109059766/68fb0ce8-8aec-4239-8489-a459ca5d2dae)

# Requirements
Before starting, ensure you meet the following prerequisites:

Docker Desktop for Windows is installed and running.

You have administrative access to your Windows machine.

### Step 1: Install kubectl
kubectl is the Kubernetes command-line tool that lets you interact with Kubernetes clusters. Install it by following these steps:

Download the latest release from this link.

Add the binary in to your PATH.

Test to ensure the version of kubectl is the same as downloaded:
```
kubectl version --client
```


### Step 2: Install KinD
To install KinD on Windows, run the following in your command prompt or PowerShell:
```

curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.11.1/kind-windows-amd64

mkdir c:/kind

Move-Item .\kind-windows-amd64.exe c:\kind\kind.exe
```
Add c:\kind to your PATH.


### Step 4: Create a Kubernetes Cluster
Create a Kubernetes cluster by running:
```
kind create cluster
```

This command creates a default cluster named "kind"


Step 5: Verify the Installation
To verify your installation, check if the cluster is up and running:
```
kubectl cluster-info
```






