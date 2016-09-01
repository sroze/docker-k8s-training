#!/bin/sh

read -p "What is the name of the context? " CONTEXT_NAME
read -p "What is the IP of the cluster? " CLUSTER_IP
read -p "What is the username? " USERNAME
read -p "What is the password? " PASSWORD
read -p "What is the default namespace you want to use? " NAMESPACE

kubectl config set-credentials $CONTEXT_NAME-$USERNAME --username=$USERNAME --password=$PASSWORD
kubectl config set-cluster $CONTEXT_NAME --server=https://$CLUSTER_IP --insecure-skip-tls-verify=true
kubectl config set-context $CONTEXT_NAME --cluster=$CONTEXT_NAME --user=$CONTEXT_NAME-$USERNAME
kubectl config use-context $CONTEXT_NAME

echo "Created the context " $CONTEXT_NAME
echo
echo "Run 'kubectl cluster-info' to verify the connectivity."
echo

