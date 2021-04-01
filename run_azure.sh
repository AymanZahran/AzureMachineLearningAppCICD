#!/bin/bash
az group create --resource-group $FLASK_RESOURCE_GROUP --location $AZURE_LOCATION --tags webserver-env="Production"
az webapp up -g $FLASK_RESOURCE_GROUP -n $FLASK_WEB_APP
az pipelines create --name "Contoso.CI" --organization https://dev.azure.com/aymancloudtesting7/Azure_CI-CD_MachineLearningApp --project Azure_CI-CD_MachineLearningApp --repository https://github.com/AymanZahran/Azure_CI-CD_MachineLearningApp
