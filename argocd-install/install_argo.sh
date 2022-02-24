#!/bin/bash
#!/bin/bash
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config-local-rke
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
helm upgrade  argocd argo/argo-cd \
    --install -n argocd --create-namespace \
    --values $SCRIPTPATH/values-override.yaml 
