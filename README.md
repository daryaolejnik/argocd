### Deploy ArgoCD
1. Update `argocd-repo-key.yaml` with relevant secrets (cat  ~/.ssh/id_rsa.pub | base64 ; cat  ~/.ssh/id_rsa | base64 )
2. Deploy secret to argocd namespace, `kubectl create namespace argocd && kubectl apply -n argocd -f argocd-repo-key.yaml`
3. Run make