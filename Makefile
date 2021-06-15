generate-cm: 
	kubectl config use-context kind-kubesphere-member
	kubectl config view --raw=true > config/kubeconfig
	kubectl create configmap kubeconfig --from-file config/kubeconfig --dry-run=client --output=yaml > kubesphere-control-plane/templates/kubeconfig-cm.yaml
deploy-kubesphere-member:
	kubectl config use-context kind-kubesphere-member
	helm install kubesphere-member kubesphere-member
	kubectl apply -f manifest/cluster-role.yaml
deploy-kubesphere-control-plane:
	kubectl config use-context kind-kubesphere-control-plane
	helm install kubesphere-control-plane kubesphere-control-plane -n kubesphere-system --create-namespace
	@echo "Congratulations! You have installed KubeSphere-Core, open your browser and enter http://localhost:30880 to use KubeSphere!"
create-cluster:
	kind create cluster --name kubesphere-member --config config/member-config
	kind create cluster --name kubesphere-control-plane --config config/control-plane-config
clean-up:
	kind delete clusters kubesphere-member kubesphere-control-plane
