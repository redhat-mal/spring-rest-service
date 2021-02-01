#!/usr/bin/env bash
echo "Installing Pipeline" 
oc project cicd-tools

git checkout stage
oc apply -f .openshift/spring-boot-demo.yaml

git checkout qa
oc apply -f .openshift/spring-boot-demo.yaml
