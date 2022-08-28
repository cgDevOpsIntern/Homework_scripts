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
addressPrefixVnet="10.1.0.0/24"
subnetsArray=("h7subnet1" "10.1.2.0/24" "h7subnet2" "10.1.3.0/24")
subname="${#subnetArray[@]}"

# Create a resource group
echo "Creating $resourceGroup in $location..."
if 
    az group exist \
    --name "$resourceGroup" \
    echo "$resourceGroup exists"
else 
    az group create \
    --name "$resourceGroup" \
    --location "$location" \
    --tags "$tag"
fi

# Create a virtual network and a front-end subnet.
echo "Creating $vNet and $subnetsArray"
az network vnet create \
--resource-group "$resourceGroup" \
--name "$vNet" \
--address-prefix "$addressPrefixVNet"  \
--location "$location" \
--subnet-name "${subnetsArray[0]}" \
--subnet-prefix "${subnetsArray[1]}" \
for (( i = 2; i < "$((subname -1))"; i += 2 )); do 
    az network vnet subnet create \ 
    -g "$resourceGroup" \
    --vnet-name "$vName" \ 
    -n "${subnetsArray[$i]}" \
    --address-prefixes "${subnetsArray[$((i + 1))]}"
done 

# Create a backend subnet.
# echo "Creating $subnetBackEnd"
# az network vnet subnet create --address-prefix $subnetPrefixBackEnd --name $subnetBackEnd --resource-group $resourceGroup --vnet-name $vNet

# Create a network security group (NSG) for the front-end subnet.

#az network vnet subnet create -g $MyResourceGroup --vnet-name MyVnet -n MySubnet \
    --address-prefixes 10.0.0.0/24 --network-security-group MyNsg --route-table MyRouteTable