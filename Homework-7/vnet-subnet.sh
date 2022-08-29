#!/bin/bash -x

#
# Homework task: Script that can create VNET with subnets. Input parameters: 
#• Region • VNet name • VNet address space • Array of subnets (names and address spaces)
#

# Variable block
let "randomIdentifier=$RANDOM*$RANDOM"
location="uksouth"
resourceGroup="homework7-build-grup"
tag="homework7-vnet-subnets"
vNet="homework7-vnet1"
VnetPrefix="10.1.0.0/24"
subnetsArray=("h7subnet1" "10.1.2.0/24" "h7subnet2" "10.1.3.0/24")
subname=${#subnetArray[@]}

# Create a resource group
echo "Creating $resourceGroup in $location..."

az group create \
    --name "$resourceGroup" \
    --location "$location" \
    --tags "$tag"

# Create a virtual network and a front-end subnet.
echo "Creating $vNet and $subnetsArray"
az network vnet create \
--resource-group "$resourceGroup" \
--location "$location" \
--name "$vNet" \
--address-prefix "$VnetPrefix"  \
--subnet-name $"{subnetsArray[0]}" \
--subnet-prefix $"{subnetsArray[1]}" 
#for ((i = 2; i < $((subname - 1)); i += 2)); 
#    do 
#        az network vnet subnet create \ 
#        -g "$resourceGroup" \
#        --vnet-name "$vNet" \ 
#        -n ${subnetsArray[$i]} \
#        --address-prefixes ${subnetsArray[$((i + 1))]}
#    done 