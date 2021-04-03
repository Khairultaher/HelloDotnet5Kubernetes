## Build + Publish ==> Deployment ==> Service Config

### Docker basic command to build and run

```
Build & Publish#1
Build image*1: docker build -t net5k8s-img:1.0 .
            OR docker build -t khairul100/net5k8s-img:1.0 .
Run tagged image*2: docker run -p 8001:80 net5k8s-img:1.0 .
                OR  docker run --name net5k8s-con -p 8001:80 net5k8s-img:1.0 .
                OR  docker run --name net5k8s-con -d -p 8001:80 khairul100/net5k8s-img:1.0 .
Publish image*3: docker push khairul100/net5k8s-img:1.0
              OR docker push khairul100/net5k8s-img:1.0
```

### kubernetes basic command to deploy and run

```
Deployment#2.1:
Creating Deployment*1: kubectl create -f deployment.yaml 
                   OR  kubectl create -f .
Rollout & Restart*1.2(when code is updated): kubectl rollout restart deployment deployment_name_here
Get Pods*2: kubectl get pods
Expose with Port*2.1: kubectl expose pod catalog-deployment-787bffb785-t5z8f --type=NodePort --name dotnet5-hw-svc2
Get Deployment*2: kubectl get deployments
Delete Deployment: kubectl delete deployment posts
Event Log: kubectl describe deployment posts
Logs*3: kubectl logs pod_name_here

Service#2.2: If service config is added in seperate file
Creating Service*1: kubectl create -f service.yaml
Get Services*2: kubectl get svc
Event Log*3: kubectl describe svc net5k8s-svc
```

### Horizontal Scaling
```
Create Replica: kubectl scale --replicas=6 deployment/net5k8s-dep

```
### Cleaning up
```
kubectl delete services net5k8s-svc
kubectl delete deployment net5k8s-dep
```

### Skaffold Setup to deploy & publish auto

```
Install from here*1: https://skaffold.dev/docs/install/ OR
Installl Chocolatey then install skaffold using powershell : choco install -y skaffold
Configure skaffold.yaml
Run command 'skaffold dev' from root directory
```

### Docker & kubernetes usefull command

```
```
