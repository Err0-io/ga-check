#!/bin/bash 
# turn the detached message off
git config --global advice.detachedHead false
# Clona el repositorio dentro del contenedor
git clone https://doe:$GH_TOKEN@$REPO /repo


# Navega al directorio del repositorio
cd /repo

git ls-remote --heads origin
git fetch --all

# Realiza el checkout del código deseado
git checkout $GITHUB_REF

# Tu código de análisis a continuación
echo $ERR0_JSON | base64 -d >> /tmp/err0agent.json
err0.sh --token-file /tmp/err0agent.json --check --git-dir /repo



