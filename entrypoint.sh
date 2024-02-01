#!/bin/bash 
# turn the detached message off
git config --global advice.detachedHead false
REPO_URL=$(echo $REPO_URL | sed 's|^https://||')
echo $REPO_URL
# Clones the repository inside the container
git clone https://doe:$GH_TOKEN@$REPO_URL /repo

# Navigate to the repository directory
cd /repo

git ls-remote --heads origin
git fetch --all

GITHUB_REF=$(echo "$GITHUB_REF" | sed 's|^refs/heads/||')
echo $GITHUB_REF
# Checkout the desired code
git checkout $GITHUB_REF
git status

# Your analysis code below
echo $ERR0_JSON | base64 -d >> /tmp/err0agent.json
err0.sh --token-file /tmp/err0agent.json --check --git-dir /repo



