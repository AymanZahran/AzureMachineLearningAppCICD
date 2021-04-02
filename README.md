# Overview

By this project, you will be able to provision Azure Machine Learning Web App and building your CI-CD pipeline which can build, test and deploy your code on your App Service with every commit

## Project Plan

Time Plan: https://trello.com/b/2aGm0TKm/azure-ml-ci-cd-project
Schedule Plan: https://1drv.ms/x/s!AieojtnBJDhtgo0KQYft8WfcndX6Rg?e=HNHRYo

## Instructions
Architectural Diagram
<img width="1362" alt="Screen Shot 2021-04-02 at 2 20 46 PM" src="https://user-images.githubusercontent.com/22683614/113415237-137e1a00-93bf-11eb-8a09-4e2f2dc395bf.png">


Output of a CI-CD Pipeline Stages and Jobs
<img width="683" alt="Screen Shot 2021-04-02 at 8 36 17 PM" src="https://user-images.githubusercontent.com/22683614/113443911-23afec80-93f3-11eb-9b9d-c91be969e90f.png">


Check Microsoft Documentation for using CI/CD to deploy a Python web app to Azure App Service on Linux
https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops



## Logs
Successful prediction from deployed flask app in Azure Cloud Shell.


 ~/Azure_CI-CD_MachineLearningApp # ./make_predict_azure_app.sh 
Port: 443
{"prediction":[20.35373177134412]}
 ~/Azure_CI-CD_MachineLearningApp # 

Output of streamed log files from deployed application
1. Deploying the Code on the App Service
<img width="1372" alt="Screen Shot 2021-04-02 at 8 38 47 PM" src="https://user-images.githubusercontent.com/22683614/113444116-8b663780-93f3-11eb-822f-30db570eaf12.png">


2. Calling the POST API call 
<img width="1309" alt="Screen Shot 2021-04-02 at 8 40 18 PM" src="https://user-images.githubusercontent.com/22683614/113444178-a9339c80-93f3-11eb-96b0-dbbfd96fc52d.png">


## Enhancements

This project could be improved by:
1. Using Terraform to build your infrastructure on azure instead of Azure CLI since Terraform is idempotent
2. Use more build jobs such as building Docker Images on Azure Container Registery (ACR), building Kubernetes namespaces and clusters 
3. Deploying your code on your Kubernetes Cluster

## Demo 

<TODO: Add link Screencast on YouTube>



