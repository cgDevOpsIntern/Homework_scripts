#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Script that creates VMs. 
#   Input parameters: VM name • VM image • VM pricing tier • VM disk pricing tier 
#   • VNet and subnet name 
#   OPTIONAL: • Custom public domain name (optional) • Reserved IP (optional)
#

# Variable block
resourceGroup="homework7-build-grup"
location="westeurope"
vmName="VMh7-ubuntu-D2s"
image="UbuntuLTS"
size="Standard_D2s_v3"
vNet="homework7-vnet1"
subnetName="subnet1h7"
reservedIP="51.143.161.229"
dnsName="VM-DNS-homework7"
SKU="Standard"


# Creating new VM
echo "...>>>..."
echo ">>>>Creating new VM based on $image and $size for $resourceGroup<<<<"
echo "...>>>..."

az vm create\
    --name "$vmName" \
    --resource-group "$resourceGroup" \
    --location "$location" \
    --image "$image" \
    --vnet-name "$vNet" \
    --subnet "$subnetName" \
    --public-ip-address "$reservedIP" \
    --public-ip-address-dns-name "$dnsName" \
    --generate-ssh-keys \
    --public-ip-address-allocation static \
    --size "$size" \
    --public-ip-sku "$SKU"

# New VM created
echo "...>>>..."
echo ">>>>New VM based on $resourceGroup created<<<<"
echo "...>>>..."
