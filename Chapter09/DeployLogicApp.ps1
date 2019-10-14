# First connect to your Azure Account.
Connect-AzAccount

# Select the subscription to deploy the App to.
Get-AzSubscription -SubscriptionId "********-****-****-****-***********"

#Create a resource group
New-AzResourceGroup -Name PacktLogicAppResourceGroup -Location EastUS

#Deploy the template inside your Azure subscription 
New-AzRmResourceGroupDeployment `
    -Name PacktDeployment `
    -ResourceGroupName PacktLogicAppResourceGroup `
    -TemplateFile c:\MyTemplates\template.json