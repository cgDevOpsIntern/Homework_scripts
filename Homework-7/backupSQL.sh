#!/bin/bash

# Variable block

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

# Previous script for creating Storage -not tested -START
#echo "Creating new Account Storage"
# Create an Azure storage account in the resource group.
#az storage account create \
#  --name $storage \
#  --location $location \
#  --resource-group $resourceGroup \
#  --sku Standard_LRS \
  #--vnet-name build-agents-01-vnet \
  #--subnet agents-subnet 

#echo "New Account Storage created"

#az storage account list -g build-agents-01

# Previous script for creating Storage -not tested -STOP

######
echo "Using resource group $resourceGroup with login: $login, password: $password..."

echo "Creating $resourceGroup in $location..."
az group create 
--name $resourceGroup \
--location "$location" \
--tags $tag

echo "Creating $storage..."
az storage account create 
--name $storage \
--resource-group $resourceGroup \
--location "$location" \ 
--sku $sku

echo "Creating $container on $storage..."
key=$(az storage account keys list --account-name $storage --resource-group $resourceGroup -o json --query [0].value | tr -d '"')
az storage container create 
--name $container \
--account-key $key \
--account-name $storage \

echo "Creating $server in $location..."
az sql server create 
--name $server \
--resource-group $resourceGroup \
--location "$location" \
--admin-user $login \
--admin-password $password \

az sql server firewall-rule create 
--resource-group $resourceGroup \
--server $server \
--name AllowAzureServices \
--start-ip-address 0.0.0.0 \
--end-ip-address 0.0.0.0 \

echo "Creating $database..."
az sql db create 
--name $database \
--resource-group $resourceGroup \
--server $server \
--edition GeneralPurpose \
--sample-name SampleDBh7 \

echo "Backing up $database..."
az sql db export 
--admin-password $password \ 
--admin-user $login \ 
--storage-key $key \
--storage-key-type StorageAccessKey \
--storage-uri "https://$storage.blob.core.windows.net/$container/$bacpac" \
--name $database \
--resource-group $resourceGroup \
--server $server \