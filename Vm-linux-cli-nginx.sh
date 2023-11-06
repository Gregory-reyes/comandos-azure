#!bin/bash
#difinir grupo de recursos y variables de entornos
export RESOURCE_GROUP_NAME="nginxdemoyoutube"
export LOCATION="westus"
export VM_NAME="vmnginxdemoyoutube"
export VM_IMAGE="Debian11"
export VM_SIZE="Standard_B1s"
export ADMIN_USERNAME="nginxdemoyoutube"

#difinir grupo de recursos
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

#create VM
az vm create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VM_NAME \
    --image $VM_IMAGE \
    --size $VM_SIZE \
    --public-ip-sku Basic \
    --authentication-type all \
    --generate-ssh-keys \
    --admin-username $ADMIN_USERNAME \
    --admin-password "AdminNginxLinux.08" \

#install nginx web server
az vm run-command invoke \
    -g $RESOURCE_GROUP_NAME \
    -n $VM_NAME --command-id RunShellScript --scripts "sudo apt-get update -y && sudo apt-get install -y nginx"

#open port 80 este script se carga al bash del portal azure y funciona.
az vm open-port --port 80 --resource-group $RESOURCE_GROUP_NAME --name $VM_NAME



