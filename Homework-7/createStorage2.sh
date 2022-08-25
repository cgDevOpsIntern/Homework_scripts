#!/bin/bash

# Variable block

--name storage01sah7 \
  --location  \
  --resource-group build-agents-01 \
  --sku Standard_LRS \

let "randomIdentifier=$RANDOM*$RANDOM"
location="uksouth"
resourceGroup="build-agents-02-storage"
tag="backup-database"
sku="Standard_LRS"
server="agents-backup-server-$randomIdentifier"
database="agentsbackup02sqldb$randomIdentifier"
login="azureuser"
password="Pa$$w0rD-$randomIdentifier"
storage="storage01sah7$randomIdentifier"
container="agents-backup02-azuresql-container-$randomIdentifier"
bacpac="backup.bacpac"

echo "Creating new Account Storage"
# Create an Azure storage account in the resource group.
az storage account create \
  --name $storage \
  --location $location \
  --resource-group $resourceGroup \
  --sku Standard_LRS \
  #--vnet-name build-agents-01-vnet \
  #--subnet agents-subnet 

echo "New Account Storage created"

az storage account list -g build-agents-01