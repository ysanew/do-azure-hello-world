# Azure Hello World App with Terraform & GitHub Actions

This project demonstrates how to:
 - Deploy an Azure App Service on Free Tier
 - Use Terraform for Infrastructure-as-Code
 - Connect Application Insights
 - Automate deploys using GitHub Actions

## Structure
 - 'main.tf' - main infrastructure
 - '.github/workflows' - CI/CD pipeline
 - 'app/index.html' - Hello World frontend

## Requirements
 - Azure account
 - Service Principal with Contributor role
 - GitHub secrets:
   - 'ARM_CLIENT_ID'
   - 'ARM_CLIENT_SECRET'
   - 'ARM_SUBSCRIPTION_ID'
   - 'ARM_TENANT_ID'

## Deploy
Push to 'main' branch to deploy
