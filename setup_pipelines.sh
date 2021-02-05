#!/usr/bin/env bash
echo "Installing Pipeline" 
oc project cicd-tools

git checkout stage
if [[ -z "$MY_GOOGLECHAT_SECRET" ]]; then
echo "Chat Disabled"
helm upgrade --install spring-rest-demo-stage ./helm/argo-app/ -set googlechat_secret=false 
else
echo "Chat Enabled"
helm upgrade --install spring-rest-demo-stage ./helm/argo-app/ --set googlechat_secret=$MY_GOOGLECHAT_SECRET --set googlechat_channel=$MY_GOOGLECHAT_CHANNEL --set googlechat_token=$MY_GOOGLECHAT_TOKEN --set googlechat_key=$MY_GOOGLECHAT_KEY
fi

git checkout qa
helm upgrade --install spring-rest-demo-qa ./helm/argo-app/  --set googlechat_secret=foobar

git checkout main
