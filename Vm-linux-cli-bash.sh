#!/bin/bash
#difinir grupo de recursos y variables de entornos
export RESOURCE_GROUP_NAME="demoyoutubevmlinux"
export LOCATION="westus"
export VM_NAME="vmdemoyoutubelinux"
export VM_IMAGE="debian"
export VM_SIZE="Standard_B1ls"
export ADMIN_USERNAME="demoyoutubevmlinux"

#desplegar un grupo de recursos
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION 

#desplegar VM usando la imagen de debian
az vm create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VM_NAME \
    --image $VM_IMAGE \
    --size $VM_SIZE \
    --public-ip-sku Basic \
    --authentication-type all \
    --generate-ssh-keys \
    --admin-username $ADMIN_USERNAME \
    --admin-password "AdminBashLinux.08" \




