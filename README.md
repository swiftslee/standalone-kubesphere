# standalone-kubesphere
This repo helps you install KubeSphere Core in another Kubernetes cluster.
## Prerequisites
Two k8s clusters, one named kind-kubesphere-member, another named cluster kind-kubesphere-control-plane.
You are assumed to install KubeSphere in cluster kind-kubesphere-control-plane which connects cluster kind-kubesphere-member.
In this tutorial, we use `kind` to create two clusters.
### Create two clusters with `kind`(optional)
Edit `config/member-config` `config/control-plane-config` and replace `apiServerAddress` with your own host machine ip.

`make create-cluster`

If everything goes well, run `kubectl config get-contexts` and you will get the following results:

```
CURRENT   NAME                            CLUSTER                         AUTHINFO                        NAMESPACE
*         kind-kubesphere-control-plane   kind-kubesphere-control-plane   kind-kubesphere-control-plane
          kind-kubesphere-member          kind-kubesphere-member          kind-kubesphere-member
```
          
### Create configmap in kubesphere-control-plane cluster
`make generate-cm`
### Create KubeSphere-Core manifests in kubesphere-member cluster
`make deploy-kubesphere-member`
### Deploy KubeSphere-Core in kubesphere-control-plane cluster
`make deploy-kubesphere-control-plane`
### Visit KubeSphere
Open your browser and enter `http://localhost:30880`, use `admin/P@88w0rd` to log into the console.
### Clean Up
`make clean-up`
## TODO
1. Support running webhook alone
2. Support ks-console connects to ks-apiserver by modifying console cm
3. Support installing KubeSphere in another namespace instead of in kubesphere-system only.(leader election&Constant&Cluster Controller&Api dispatch&Devops s2i binary hardcoded)
4. Support launching kubectl pod with `--kubeconfig` flag.
5. Supprot installing monitoring agent in kubesphere-member cluster.