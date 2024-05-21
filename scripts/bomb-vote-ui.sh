#!/bin/bash

BINARY="./scripts/bin/hey_linux_amd64"

$BINARY -z 3m -m POST http://localhost:31000 -d '{"vote": "a","voter_id": ""}' &
$BINARY -z 3m -m POST http://localhost:31010 -d '{"vote": "a","voter_id": ""}' &

wait