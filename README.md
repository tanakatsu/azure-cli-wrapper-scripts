# Azure CLI wrapper scripts

Wrapper scripts for Azure virtual machines inspired by [fast.ai](http://www.fast.ai/)'s [aws-alias.sh](https://github.com/fastai/courses/blob/master/setup/aws-alias.sh)

Hope this is useful.

## Requirements

- [Azure CLI](https://github.com/Azure/azure-cli)
- jq

## Preparation

Edit `azure-env.sh` depending on your environment.

- vmName: Virtual machine name
- resourceGroup: Resource group
- privateKeyPath: Path to your ssh private key (~/.ssh/path\_to\_your\_key)
- jupyterRootDir: Path to your jupyter notebook directory (This must be a relative path from home directory)

## Usage

```
# set environment variables and aliases (you MUST do this before executing other commands)
source azure-env.sh
source azure-alias.sh

# start vm
azure-start

# get ip address
azure-ip

# ssh login
azure-ssh

# start jupyter notebook server from local machine
azure-start-jupyter

# open jupyter notebook on local machine
./azure-open-jupyter.sh

# stop and deallocate
azure-stop
```

## License

MIT

