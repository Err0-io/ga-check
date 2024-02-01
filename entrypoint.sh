#!/bin/bash

echo $ERR0_JSON | base64 -d >> /tmp/err0agent.json
err0.sh --token-file /tmp/err0agent.json --branch ${GITHUB_REF##*/} --check --git-dir .
