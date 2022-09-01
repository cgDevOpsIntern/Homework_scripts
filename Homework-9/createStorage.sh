#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Script that can create Storage Account. 
#    Input parameters: -Region -Name -Pricing tier
#

# Variable block
rGroup="homework7-build-grup"
location="westeurope"
name="storage01sah7"
tag="homework7"
sku="Standard_LRS"
kind="StorageV2"

# Create an Azure storage account in the resource group.
echo "...>>>..."
echo ">>>>Creating new Storage account $name in $rGroup group<<<<"
echo "...>>>..."

az storage account create \
  --name "$name" \
  --resource-group "$rGroup" \
  --location "location" \
  --sku "$sku" \
  --kind "$kind" \

echo "...>>>..."
echo ">>>>New Storage account $name created<<<<"
echo "...>>>..."