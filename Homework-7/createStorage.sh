#!/bin/bash

# Create an Azure storage account in the resource group.
az storage account create \
  --name Storage-Account \
  --location uksouth \
  --resource-group build-agents-01 \
  --sku Standard_LRS \
  --vnet-name build-agents-01-vnet \
  --subnet agents-subnet