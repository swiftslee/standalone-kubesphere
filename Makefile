generate-cm: 
	kubectl create configmap kubeconfig --from-file kubeconfig --dry-run=true --output=yaml > outside-kubesphere/templates/kubeconfig-cm.yaml

deploy-inside-cluster: 
	helm install kubesphere-inside in-cluster/
	kubectl apply -f manifest/cluster-role.yaml
deploy-outside-cluster:
	helm install kubesphere-outside outside-kubesphere/ -n kubesphere-system --create-namespace