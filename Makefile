generate-cm: 
	kubectl create configmap kubeconfig --from-file kubeconfig --dry-run=client --output=yaml > kubesphere-outside/templates/kubeconfig-cm.yaml

deploy-inside-cluster: 
	helm install kubesphere-inside kubesphere-inside
	kubectl apply -f manifest/cluster-role.yaml
deploy-outside-cluster:
	helm install kubesphere-outside kubesphere-outside/ -n kubesphere-system --create-namespace