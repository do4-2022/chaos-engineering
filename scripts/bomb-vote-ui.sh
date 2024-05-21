#!/bin/bash

BINARY="./scripts/bin/hey_linux_amd64"

export KUBECONFIG="terraform/modules/k0s/output/kubeconfig.yaml"
kubectl port-forward svc/vote-ui 31000:80 -n votingapp &
kubectl port-forward svc/vote-ui 31010:80 -n votingapp-nats &

$BINARY -z 3m -m POST http://localhost:31000 -d '{"vote": "a","voter_id": ""}' &
$BINARY -z 3m -m POST http://localhost:31010 -d '{"vote": "a","voter_id": ""}' &

wait