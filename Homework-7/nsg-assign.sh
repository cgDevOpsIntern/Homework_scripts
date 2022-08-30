#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Homework task: Script that assigns NSG to VNet subnet. 
#    Input parameters: • NSG name • VNet and subnet name
#

# Variable block
resourceGroup="homework7-build-grup"
nsgName="NSGh7"
vNet="homework7-vnet1"
subnetArray=("subnet1h7" "subnet2h7")


#Assigning NSG to VNet subnets
echo ">>>>Assigning NSG to VNet and subnets<<<<"

for ((i=0; i<2; i++))
do
    az network vnet subnet update \
    -g "$resourceGroup" \
    --vnet-name "$vNet" \
    -n ${subnetArray[$i]} \
    --network-security-group "$nsgName"
done \

#NSG rule assigned to VNet and subnets
echo ">>>>NSG rule assigned to VNet and subnets<<<<"