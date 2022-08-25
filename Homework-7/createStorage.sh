#!/bin/bash
echo "Creating new Account Storage"
# Create an Azure storage account in the resource group.
az storage account create \
  --name storage01sah7 \
  --location uksouth \
  --resource-group build-agents-01 \
  --sku Standard_LRS \
  #--vnet-name build-agents-01-vnet \
  #--subnet agents-subnet 

echo "New Account Storage created"

az storage account list -g build-agents-01