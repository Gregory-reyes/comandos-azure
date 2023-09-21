$ResourceGroupName = "powershell-webapp"
$Location = "East US 2"
$AppServicePlanName = "powershell-webapp-plan"
$WebAppName = "powershell-webappprueba01"

Connect-AzAccount

# Create a resource group
New-AzResourceGroup -Name $ResourceGroupName -Location $Location

# Create an App Service plan
New-AzAppServicePlan -ResourceGroupName $AppServicePlanName -Location $Location  tier Free `
-Name $AppServicePlanName

# Create a web app
New-AzWebApp -ResourceGroupName $ResourceGroupName -Location $Location -Name $WebAppName -AppServicePlan $AppServicePlanName 