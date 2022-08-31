#!/bin/bash

#
# 1. to see variables ad "-x" to "hashbang/bin/bash" line on top.
# 2. Script that can create Linux based App Service for 
#    Input parameters: 
#   -Region -Name -Pricing tier -Nodes in web farm -Docker Hub image to be used
# 3. Changed "resourceGroup" variable name to "rGgroup"
#

# Variable block
# for the plan
rGroup="homework7-build-grup"
location="westeurope"
sPlan="linux-app-service-plan"
workers="1"
sku="B1"
#for an app
appName="homework8app"
containerImg="mcr.microsoft.com/dotnet/samples:aspnetapp"

# Creating new VM
echo "...>>>..."
echo ">>>>Creating new Plan $sPlan<<<<"
echo "...>>>..."

az appservice plan create \
    --resource-group "$rGroup" \
    --name "$sPlan" \
    --location "$location" \
    --is-linux \
    --number-of-workers "$workers" \ 
    --sku "$SKU" \

# Creating new APP
echo "...>>>..."
echo ">>>>Creating APP $appName<<<<"
echo "...>>>..."

az webapp create\
    --resource-group "$rGroup" \
    --plan "$sPlan" \
    --name "$appName" \
    --deployment-container-image-name "$containerImg" \

# New Service Plan and new App created
echo "...>>>..."
echo ">>>>New Service Plan and new App on $resourceGroup created<<<<"
echo "...>>>..."