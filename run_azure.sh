#!/bin/bash
az group create --resource-group $FLASK_RESOURCE_GROUP --location $AZURE_LOCATION --tags webserver-env="Production"
az webapp up -g $FLASK_RESOURCE_GROUP -n $FLASK_WEB_APP
