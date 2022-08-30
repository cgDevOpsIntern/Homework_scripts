#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Homework task: Script that assigns NSG to VNet subnet. 
#    Input parameters: • NSG name • VNet and subnet name
#

# Variable block
#let "randomIdentifier=$RANDOM*$RANDOM"
echo "Assigning NSG to VNet subnets"
resourceGroup="homework7-build-grup"
nsgName="NSGh7"
vNet="homework7-vnet1"
subnetArray=("subnet1h7" "subnet2h7")

for ((i=0; i<2; i++))
do
    az network vnet subnet update \
    -g "$resourceGroup" \
    -n ${subnetArray[$i]} \
    --vnet-name "$vNet" \
    --network-security-group "$nsgName" \
done    
