#!/bin/bash

list=`ssh -i ${privateKeyPath} ubuntu@${instanceId} 'export PATH=~/anaconda3/bin:$PATH;source activate fastai;jupyter notebook list'`
url=`echo $list | grep http | sed -e "s/localhost/${instanceId}/g" | awk '{print $4}'`
echo $url
open $url
