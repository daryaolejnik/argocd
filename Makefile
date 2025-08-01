deploy-argo:
	kubectl apply -k argocd
	kubectl apply -f argocd.yaml

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