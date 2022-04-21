#!/bin/sh

if [ -z "$1" ]
  then
    echo  "NoTargetInventory"
    exit 255
fi

INVENTORY="inventory-$1"
AV_PATH="~/.hetzner/avpw-$1"

export ANSIBLE_VAULT_PASSWORD_FILE=$AV_PATH

echo $ANSIBLE_VAULT_PASSWORD_FILE
ls $ANSIBLE_VAULT_PASSWORD_FILE
ls $AV_PATH

echo $INVENTORY
ls $INVENTORY

ansible-playbook  $2  -i $INVENTORY ./ansible/setup-reset-node.yml

#ansible-playbook -i $INVENTORY ansible/00-provision-hetzner.yml
#ansible-playbook -i $INVENTORY ansible/00-provision-hetzner.yml