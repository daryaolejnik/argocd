deploy-argo:
	sops --decrypt --in-place --kms "arn:aws:kms:eu-north-1:102205351130:key/7f24b0cf-8aa6-48c0-989d-7fef0a9194c6" --aws-profile nix-k8s argocd-repo-key.yaml
	kubectl apply -k argocd
	kubectl apply -f ./infrastructure/infrastructure-namespace.yaml
	kubectl apply -f ./infrastructure/argocd.yaml
	kubectl apply -f argocd.yaml
	sops --encrypt --in-place --kms "arn:aws:kms:eu-north-1:102205351130:key/7f24b0cf-8aa6-48c0-989d-7fef0a9194c6" --aws-profile nix-k8s argocd-repo-key.yaml

delete-argo:
	kubectl delete -f argocd.yaml
	kubectl delete all --all -n argocd
	kubectl delete secrets --all -n argocd
	kubectl delete configmaps --all -n argocd
	kubectl delete roles --all -n argocd
	kubectl delete rolebindings --all -n argocd

install-deps:
	helm dependency update ./infrastructure/ingress-nginx
	helm dependency update ./infrastructure/metrics-server

deploy-infra:
	kubectl apply -f ./infrastructure/infrastructure-namespace.yaml
	kubectl apply -f ./infrastructure/argocd.yaml

encrypt-repo-key:
	sops --encrypt --in-place --kms "arn:aws:kms:eu-north-1:102205351130:key/7f24b0cf-8aa6-48c0-989d-7fef0a9194c6" --aws-profile nix-k8s argocd-repo-key.yaml