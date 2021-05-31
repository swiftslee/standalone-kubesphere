generate-cm: 
	kubectl create configmap kubeconfig --from-file kubeconfig --dry-run=client --output=yaml > kubesphere-outside/templates/kubeconfig-cm.yaml

deploy-kubesphere-inside:
	helm install kubesphere-inside kubesphere-inside
	kubectl apply -f manifest/cluster-role.yaml
deploy-kubesphere-outside:
	helm install kubesphere-outside kubesphere-outside/ -n kubesphere-system --create-namespace