#!/bin/bash

# You need to login by `az login`

alias azure-start='az vm start --resource-group ${resourceGroup} --name ${vmName} && export instanceId=`az vm list-ip-addresses --name ${vmName} | jq .[].virtualMachine.network.publicIpAddresses[0].ipAddress | tr -d \"`;echo $instanceId'
alias azure-stop='az vm stop --resource-group ${resourceGroup} --name ${vmName} && az vm deallocate --resource-group ${resourceGroup} --name ${vmName}'
#alias azure-ssh='ssh -i ${privateKeyPath} ubuntu@${instanceId}'
alias azure-ssh='ssh -i ${privateKeyPath} -o "StrictHostKeyChecking no" ubuntu@${instanceId}'
alias azure-ssh-portforward='ssh -i ${privateKeyPath} -o "StrictHostKeyChecking no" -L ${portForwardLocalPort}:localhost:8888 ubuntu@${instanceId}'

alias azure-ip='export instanceId=`az vm list-ip-addresses --name ${vmName} | jq .[].virtualMachine.network.publicIpAddresses[0].ipAddress | tr -d \"`;echo $instanceId'

function azure-scp-from() {
  scp -i ${privateKeyPath} ubuntu@${instanceId}:"$1" $2
}

function azure-scp-to() {
    command scp -i ${privateKeyPath} $1 ubuntu@${instanceId}:"$2"
}

#alias azure-start-jupyter='ssh -i ${privateKeyPath} ubuntu@${instanceId} "export PATH=~/anaconda3/bin:$PATH;source activate fastai;cd ${jupyterRootDir};jupyter notebook"'
alias azure-start-jupyter='ssh -i ${privateKeyPath} -o "StrictHostKeyChecking no" ubuntu@${instanceId} "export PATH=~/anaconda3/bin:$PATH;source activate fastai;cd ${jupyterRootDir};jupyter notebook"'




