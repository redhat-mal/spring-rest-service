#!/usr/bin/env bash
echo "Installing Pipeline" 
oc project cicd-tools

git checkout main
helm upgrade --install spring-rest-demo-stage ./helm/argo-app/ --set googlechat_secret=foobar

git checkout qa
helm upgrade --install spring-rest-demo-qa ./helm/argo-app/  --set googlechat_secret=foobar

