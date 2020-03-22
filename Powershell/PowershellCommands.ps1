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
$rgNametoDel = Get-AzResourceGroup | Where-Object -FilterScript {$PSItem.ResourceGroupName -eq 'your-RG-name'}
$rgName = $rgNametoDel.ResourceGroupName
Get-AzResourceLock | Where-Object -FilterScript {$PSItem.resourcegroupname -eq $rgName} | Remove-AzResourceLock -Force -Verbose
Remove-AzResourceGroup -Name $rgName -Force -Verbose

#Azure VM
Get-AzVM

#Update Azure VM Type
$resourceGroupName = 'AZ1000202-RG'
$AzVm = Get-AzVM -Name SimpleWinVM -ResourceGroupName $resourceGroupName
$azVm.HardwareProfile.VmSize = "Standard_A3"
Update-AzVM -ResourceGroupName $resourceGroupName -VM $azVm -Verbose




