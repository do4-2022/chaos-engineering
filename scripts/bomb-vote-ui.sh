#!/bin/bash

BINARY=hey_linux_amd64

kubectl port-forward svc/vote-ui 31000:80 -n votingapp
kubectl port-forward svc/vote-ui 31010:80 -n votingapp-nats

./$BINARY -z 3m -m GET http://localhost:31000
./$BINARY -z 3m -m GET http://localhost:31010