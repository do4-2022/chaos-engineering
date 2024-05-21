#!/bin/bash

export KUBECONFIG="terraform/modules/k0s/output/kubeconfig.yaml"

kubectl port-forward svc/vote-ui 31000:80 -n votingapp &
kubectl port-forward svc/vote-ui 31010:80 -n votingapp-nats &
kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring &
kubectl port-forward svc/chaos-dashboard 2333:2333 -n chaos-mesh &

wait