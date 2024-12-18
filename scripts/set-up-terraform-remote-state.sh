#!/usr/bin/env bash

##? This script will help you to create Terraform remote azurerm backend resources.
##? Please go through the notifications/notes available in the script.
##? Script will create and check if existing: Resource Group, Storage Account, and Storage Container.
##? To override the names for the resources, kindly set the respective environment variables.
##? LOCATION :: RESOURCE_GROUP_NAME :: STORAGE_ACCOUNT_NAME :: CONTAINER_NAME

set -ue  # Stop execution on error or undefined variable

# Print important instructions
printf '\e[1;31m%-6s\e[0m\n' "### IMPORTANT NOTE ###: Please login to Azure first using az login and set up the correct Azure subscription"
printf '\e[1;31m%-6s\e[0m\n' "az login                                         => Login to Azure CLI."
printf '\e[1;31m%-6s\e[0m\n' "az account list --output table                   => Check which Azure accounts/subscriptions you have."
printf '\e[1;31m%-6s\e[0m\n' "az account set -s <your-azure-subscription-id>   => Set the right Azure account."

# Display default values and instructions for overriding
cat <<-EOF

Default Values for location, resource group, storage account, and container name are set...
To override the values, please export below environment variables with the required values:

### "YOUR VALUE" HAS TO BE REPLACED WITH YOUR REQUIRED INPUT ###

export LOCATION="YOUR VALUE"
export RESOURCE_GROUP_NAME="YOUR VALUE"
export STORAGE_ACCOUNT_NAME="YOUR VALUE"
export CONTAINER_NAME="YOUR VALUE"

EOF

# Ask for confirmation to proceed
printf '\e[1;32m%-6s\e[0m' "Kindly read the above info and press yes or y to continue: "
read -r RESPONSE
LOWER_CASE_RESPONSE="$(echo "$RESPONSE" | awk '{ print tolower($1) }')"

# Set default values
LOCATION=${LOCATION:-"westeurope"}
RESOURCE_GROUP_NAME=${RESOURCE_GROUP_NAME:-"rg-ansible-terraform"}
STORAGE_ACCOUNT_NAME=${STORAGE_ACCOUNT_NAME:-"stgansitera$(date +%s)"}  # Unique name with timestamp
CONTAINER_NAME=${CONTAINER_NAME:-"tfstate"}

# Proceed only if the user confirms
if [[ "$LOWER_CASE_RESPONSE" == "yes" || "$LOWER_CASE_RESPONSE" == "y" ]]; then
  printf "#######################################################################\n"
  printf "#### Creating Storage Account for Terraform backend configuration ####\n"
  printf "#######################################################################\n\n"

  # Ensure Azure CLI is installed
  if [[ $(command -v az) ]]; then
    # Check and create the resource group
    echo "### Checking Resource Group ###"
    if ! az group show --name "$RESOURCE_GROUP_NAME" &>/dev/null; then
      echo "-> Resource group $RESOURCE_GROUP_NAME does not exist. Creating it in $LOCATION..."
      az group create --name "$RESOURCE_GROUP_NAME" --location "$LOCATION"
    else
      echo "-> Resource group $RESOURCE_GROUP_NAME already exists."
    fi

    # Check and create the storage account
    echo "### Checking Storage Account ###"
    if ! az storage account show --resource-group "$RESOURCE_GROUP_NAME" --name "$STORAGE_ACCOUNT_NAME" &>/dev/null; then
      echo "-> Creating Storage Account $STORAGE_ACCOUNT_NAME..."
      az storage account create \
        --resource-group "$RESOURCE_GROUP_NAME" \
        --name "$STORAGE_ACCOUNT_NAME" \
        --sku Standard_LRS \
        --encryption-services blob \
        --location "$LOCATION"
    else
      echo "-> Storage Account $STORAGE_ACCOUNT_NAME already exists."
    fi

    # Retrieve storage account key and create blob container
    echo "### Retrieving Storage Account Key ###"
    ACCOUNT_KEY=$(az storage account keys list \
      --resource-group "$RESOURCE_GROUP_NAME" \
      --account-name "$STORAGE_ACCOUNT_NAME" \
      --query "[0].value" -o tsv)

    echo "### Checking Blob Container ###"
    if ! az storage container show --name "$CONTAINER_NAME" --account-name "$STORAGE_ACCOUNT_NAME" --account-key "$ACCOUNT_KEY" &>/dev/null; then
      echo "-> Creating Blob Container $CONTAINER_NAME..."
      az storage container create \
        --name "$CONTAINER_NAME" \
        --account-name "$STORAGE_ACCOUNT_NAME" \
        --account-key "$ACCOUNT_KEY"
    else
      echo "-> Blob Container $CONTAINER_NAME already exists."
    fi

    # Final success message
    printf '\e[1;32m%-6s\e[0m\n' "Resource Group Name: $RESOURCE_GROUP_NAME"
    printf '\e[1;32m%-6s\e[0m\n' "Storage Account Name: $STORAGE_ACCOUNT_NAME"
    printf '\e[1;32m%-6s\e[0m\n' "Blob Container Name: $CONTAINER_NAME"

    printf "##############################################################\n"
    printf '\e[1;31m%-6s\e[0m\n' "Configure the Terraform backend with the above configurations"
    printf "##############################################################\n\n"

  else
    echo "Azure CLI not found. Please install it using https://learn.microsoft.com/en-us/cli/azure/install-azure-cli"
    exit 1
  fi
else
  echo "You chose not to proceed. Exiting the script."
fi
