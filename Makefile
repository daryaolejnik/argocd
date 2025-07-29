
deploy:
	kubectl apply -k argocd
	kubectl apply -f argocd.yaml
delete:
	kubectl delete -f argocd.yaml
	kubectl delete all --all -n argocd
	kubectl delete secrets --all -n argocd
	kubectl delete configmaps --all -n argocd
	kubectl delete roles --all -n argocd
	kubectl delete rolebindings --all -n argocd