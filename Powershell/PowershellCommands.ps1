#Subscription
$azSubscription = Get-AzSubscription
$azSubscription | Format-List *
$azSubscription.ExtendedProperties


#Resource Group
Get-AzResourceGroup

#Attention: If a resource group has a lock, you have to unlock it first
Remove-AzResourceGroup -Name "YourRGName"

#Get and Remove an Azure Resource Group with no lock
Get-AzResourceGroup | Where-Object -FilterScript {$PSItem.ResourceGroupName -eq 'azlocalteste'} | 
Remove-AzResourceGroup -Force -Verbose

#Remove Resource Group with Lock
$rgNametoDel = Get-AzResourceGroup | Where-Object -FilterScript {$PSItem.ResourceGroupName -eq 'az1000201-RG'}
$rgName = $rgNametoDel.ResourceGroupName
Get-AzResourceLock | Where-Object -FilterScript {$PSItem.resourcegroupname -eq $rgName} | Remove-AzResourceLock -Force -Verbose
Remove-AzResourceGroup -Name $rgName -Force -Verbose

