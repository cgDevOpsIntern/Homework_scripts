#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Homework task: Script that can create VNET with subnets. Input parameters: 
#   • Region • VNet name • VNet address space • Array of subnets (names and address spaces)
#

# Variable block
#let "randomIdentifier=$RANDOM*$RANDOM"
location="uksouth"
resourceGroup="homework7-build-grup"
tag="homework7"
vNet="homework7-vnet1"
VnetPrefix="10.1.0.0/16"
subnetArray=("subnet1h7" "10.1.0.0/24" "subnet2h7" "10.1.1.0/24")
subname=${#subnetArray[@]}

# Create a resource group
echo "Creating $resourceGroup in $location..."

az group create \
    --name "$resourceGroup" \
    --location "$location" \
    --tags "$tag"

# Create a virtual network and a subnets.
echo "Creating $vNet and $subnetArray"
az network vnet create \
--resource-group "$resourceGroup" \
--location "$location" \
--name "$vNet" \
--address-prefix "$VnetPrefix"  \
--subnet-name ${subnetArray[0]} \
--subnet-prefix ${subnetArray[1]} 
for ((i = 2; i < $((subname - 1)); i += 2)); 
    do 
        az network vnet subnet create \
        --resource-group "$resourceGroup" \
        --vnet-name "$vNet" \
        --name ${subnetArray[$i]} \
        --address-prefixes ${subnetArray[$((i + 1))]}
    done 