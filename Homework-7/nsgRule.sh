#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Homework task: Script that can create NSG. 
#   Input parameters: • Region • Name • Array of rules
#

# Variable block
#let "randomIdentifier=$RANDOM*$RANDOM"
resourceGroup="homework7-build-grup"
nsgName="NSGh7"
location="uksouth"
tag="homework7"
nsgRule='nsgRuleh7'
priority="1000"
arrayRules=("Allow" "Inbound" "Tcp")

# Creating NSG rule
echo "Creating $nsgName rule"

az network nsg create \
-g "$resourceGroup" \
-n "$nsgName" \
-l "$location" \
--tags "$tag" \

az network nsg rule create \
    --resource-group "$resourceGroup" \
    --nsg-name "$nsgName" \
    --name "$nsgRule" \
    --priority "$priority" \
    --access ${arrayRules[0]} \
    --direction ${arrayRules[1]} \
    --protocol ${arrayRules[2]} \
    --tags "$tag" \


echo "$nsgName in $resourceGroup created"