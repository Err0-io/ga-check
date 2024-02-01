#!/bin/bash

# Turn the detached message off
git config --global advice.detachedHead false

# Remove "https://" from REPO_URL
REPO_URL=$(echo $REPO_URL | sed 's|^https://||')
echo $REPO_URL

# Clone the repository inside the container
git clone https://doe:$GH_TOKEN@$REPO_URL /repo

# Navigate to the repository directory
cd /repo

# List remote branches
git ls-remote --heads origin

# Fetch all branches
git fetch --all

# If BRANCH_NAME is not empty, update GITHUB_REF
if [ -n "$BRANCH_NAME" ]; then
  echo "Setting GITHUB_REF to $BRANCH_NAME"
  GITHUB_REF=$BRANCH_NAME
  export GITHUB_REF
else
  echo "BRANCH_NAME is empty. Not updating GITHUB_REF."
fi

# Remove "refs/heads/" from GITHUB_REF
GITHUB_REF=$(echo "$GITHUB_REF" | sed 's|^refs/heads/||')
echo $GITHUB_REF

# Checkout the desired code
git checkout $GITHUB_REF
git status

# Your analysis code below
echo $ERR0_JSON | base64 -d >> /tmp/err0agent.json
err0.sh --token-file /tmp/err0agent.json --check --git-dir /repo
