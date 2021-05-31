# standalone-kubesphere
This repo help you install KubeSphere Core outside your own cluster
## Prepare
two K8s clusters, one named cluster A, another named cluster B.
You are assumed to install KubeSphere in cluster B which connects cluster A.
## Installation Steps
### Step One
Paste the cluster A kubeconfig into the `kubeconfig` file, then execute
`make generate-cm`
### Step Two
run `make deploy-kubesphere-inside` in cluster A
### Step Three
run `make deploy-kubesphere-outside` in cluster B
### Vist KubeSphere Core
Open your browser and enter `$clusterB_NodeIp:30880`, if everything goes well, 
use `admin/P@88w0rd` to log into the console.
## TODO
1. Support installing webhook under mannifest/webhook.yaml
2. Support installing KubeSphere in another namespace instead of in kubesphere-system only.
3. Support launching kubectl pod with `--kubeconfig` flag.
4. Supprot installing monitoring agent in user's cluster.