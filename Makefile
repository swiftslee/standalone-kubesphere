generate-cm: 
	kubectl create configmap kubeconfig --from-file kubeconfig --dry-run=true --output=yaml > outside-kubesphere/templates/kubeconfig-cm.yaml
