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

# Sucessfully created storage account "storage01sah7" see detail below.

# Resource group: build-agents-01
# Location:UK South

# Subscription: Azure subscription 1
# Disk state: Available
# Performance: Standard
# Replication: Locally-redundant storage (LRS)

# Account kind: StorageV2 (general purpose v2)
# Provisioning state: Succeeded
# Created: 8/25/2022, 12:29:09 PM
