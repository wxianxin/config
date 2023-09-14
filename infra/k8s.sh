# Kubernetes
kubectl get nodes
kubectl get pods
# namespaces
kubectl get pods --all-namespaces
# kube-system namespace: where k8s run the system resources

kubectl create namespace webserver
kubectl config set-context --current --namespace webserver  # switch namespace
kubectl run nginx --image nginx
kubectl get pods -o wide
kubectl delete pod nginx
kubectl apply -f deployment.yaml    # deploy a pod using yaml config file

# you will see an ip address in the output of kubectl get pods -o wide
# it's the cluster ip, it's only accessible within the k8s cluster since it's an internal ip address
# if you want the internal port accessible in the external network you will have to define a service
kubectl apply -f service.yaml
kubectl get service


