
#!/bin/bash

#variables
resourcegroup="azure2023demo"
location="westeurope"
vmname="vmbclidemo"

#resource group
az group create --name $resourcegroup --location $location

#create vm
az vm create \
        --resource-group $resourcegroup \
        --name $vmname \
        --image Win2022AzureEditionCore \
        --public-ip-sku Standard \
        --admin-username "Demoyoutube.08" 

#Install Web Server
az vm run-command invoke -g $resourcegroup \
        -n $vmname \
        --command-id RunPowerShellScript \
         --scripts "Install-WindowsFeature -name Web-Server -IncludeManagementTools"

#open port
az vm open-port --port 80 --resource-group $resourcegroup --name $vmname

