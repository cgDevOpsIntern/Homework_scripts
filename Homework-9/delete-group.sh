#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Script that can delete all services from the Resource Group. 
#    Input parameters: -Resource Group name.
#

# Variable block
rGroup="homework7-build-grup"

# Delete group
echo "...>>>..."
echo ">>>>Deleting $rGroup group <<<<"
echo "...>>>..."

az group delete --name "$rGroup" --yes

echo "...>>>..."
echo ">>>>Group $rGroup has been deleted<<<<"
echo "...>>>..."
