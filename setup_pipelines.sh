#!/usr/bin/env bash
echo "Installing Pipeline" 
oc project cicd-tools

git checkout stage
helm upgrade --install spring-demo-stage ./helm/argo-app/ --values ./helm/argo-app/stage-values.yaml --set googlechat_secret=foobar

#git checkout qa
#oc apply -f .openshift/spring-boot-demo.yaml
