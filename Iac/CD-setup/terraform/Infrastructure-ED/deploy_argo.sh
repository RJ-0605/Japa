#! /bin/sh



git clone ssh://git@kwao75.port0.org:8022/argocd/final-project-just-argo-for-infra-apps.git

cd final-project-just-argo-for-infra-apps/myargo

git pull origin main -f 

kubectl create namespace argocd

# helm install rodney-argo-cd . -n argocd 

helm upgrade rodney-argo-cd . -n argocd 

kubectl get all -n argocd

# run port forwarded argocd in detached mode 
# kubectl port-forward service/argocd-server -n argocd 8085:443 

sleep 12 

exit 0














# helm uninstall ingress-nginx-rodney . -n argocd


# helm repo add bitnami https://charts.bitnami.com/bitnami 

# helm repo add jetstack https://charts.jetstack.io

# helm repo add prometheus-community https://prometheus-community.github.io/helm-charts



# helm upgrade inginx-ingress-jed nginx-ingress-controller/


# kubectl port-forward deployment.apps/prometheus-grafana 3000:3000


# kubectl delete  ValidatingWebhookConfigurations certmanager-argo-application-cert-manager-webhook

# helm fetch bitnami/elasticsearch

# kubectl port-forward svc/kibana 8080:5601

# helm upgrade  kibana my-repo/kibana \ --set elasticsearch.hosts[0]=elasticsearch-coordinating-hl.default.svc.cluster.local,elasticsearch.port=9200

# helm install kibana bitnami/kibana --set elasticsearch.enabled=false --set elasticsearch.external.hosts[0]=elasticsearch.default.svc.cluster.local --set elasticsearch.external.port=9200 --set service.type=LoadBalancer

# kubectl port-forward --namespace default svc/elasticsearch 9200:9200