#!/bin/bash
`
#################################
#   Kubernetes                  #
#################################
# other Toools
  k9s, helm,
# kube cli
  kubeadm, kubectl, kubens, kubectx, kubetail, kubefwd, kubens, kubectx, kubetail, kubefwd
# kubectl
  k get nodes -A
  k get pods -A
  k get svc -A
  k get deployment -A
  k get statefulset -A
  k get storageclass -A
  k get namespace -A
  k apply -k ./
  k describe
  k delete all --all -n <namespace>
  k describe nodes # 割り当て可能なメモリとリクエストの確認
# kubeadm
  kubeadm init
  kubeadm join
  kubeadm token create
  kubeadm token list
  kubeadm token delete
  kubeadm token create --print-join-command
  # stdout: kubeadm join 192.168.11.110:8443 --token ey544l.7gvqjml99v08t5k9 --discovery-token-ca-cert-hash sha256:cfd36a88a78d469cf521998a4891a0317a75889f2e73c338ddbcba9dcee47754
  kubeadm reset
  kubeadm config migrate
  kubeadm config print
  kubeadm config images list
  kubeadm config images pull
  kubeadm config images pull --config ./kubeadm-config.yaml
  kubeadm config images pull --kubernetes-version v1.21.0
  kubeadm config images pull --kubernetes-version v1.21.0 --config ./kubeadm-config.yaml
  kubeadm config images list --kubernetes-version v1.21.0
  kubeadm config images list --config ./kubeadm-config.yaml
  kubeadm config images list --kubernetes-version v1.21.0 --config ./kubeadm-config.yaml --output json | jq '.images[] | .newName'
# Migration Commands
migrate        : configuration file migration.
               : (e.g., kubeadm config migrate --old-config ./join_kubeadm_cp.yaml --new-config ./new_join_kubeadm_cp.yaml)
drain          : kubectl drain <node-name> --ignore-daemonsets --delete-local-data

#################################
#   minikube                    #
#################################
minikube start
kubectl get po -A
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
kubectl port-forward service/hello-minikube 7080:8080 # http://localhost:7080/
minikube stop
minikube delete --all
minikube addons list
minikube config set memory 9001 # Change the default memory limit (requires a restart):
minikube start -p aged --kubernetes-version=v1.16.1

'
