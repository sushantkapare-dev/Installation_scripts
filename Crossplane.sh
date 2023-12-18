#!/bin/bash

# Set Crossplane version
CROSSPLANE_VERSION="v1.7.0"

# Install Crossplane CLI (kubectl-crossplane)
curl -sL https://github.com/crossplane/crossplane/releases/download/${CROSSPLANE_VERSION}/kubectl-crossplane-linux-amd64 -o kubectl-crossplane
chmod +x kubectl-crossplane
sudo mv kubectl-crossplane /usr/local/bin/

# Install Crossplane
kubectl crossplane install provider --provider crossplane/provider-helm:v1.7.0

# Wait for Crossplane components to be ready
kubectl wait --for=condition=available --timeout=300s deployment -l crossplane.io/scope=provider-system

# Display Crossplane version
kubectl get crossplane version

echo "Crossplane installed successfully."
