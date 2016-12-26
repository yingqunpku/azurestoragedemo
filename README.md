# Azure (Stack) Storage Demo with Node.js
This is a web app sample with Node.js bundled with ARM template and DSC Extension.
The web app runs simple scenario tests against Azure Consistent Storage APIs through Azure Node.js SDK. 
The bundle also demonstrates how a tenant could deploy an Azure (Stack) Node.js web application with DSC extension on an Azure (Stack) VM created with an ARM template.

[![Visualize the ARM Template](http://armviz.io/visualizebutton.png "Visualize the ARM Template")](http://armviz.io/#/?load=https://raw.githubusercontent.com/yingqunpku/azurestoragedemo/master/ARMTemplate/Templates/WindowsVirtualMachine.json)

[![Deploy to Azure.com](http://azuredeploy.net/deploybutton.png "Deploy to Azure.com")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fyingqunpku%2Fazurestoragedemo%2Fmaster%2FARMTemplate%2FTemplates%2FWindowsVirtualMachine.json)  [![Deploy to Azure Stack](https://github.com/yingqunpku/azurestoragedemo/raw/master/ARMTemplate/Templates/deploytoazurestack.png "Deploy to Azure Stack")](https://portal.azurestack.local/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fyingqunpku%2Fazurestoragedemo%2Fmaster%2FARMTemplate%2FTemplates%2FWindowsVirtualMachine.json)

## Prerequisites
To deploy this application, you must have one of the following: 
* A subscription on Azure.com, or 
* An Azure Stack TP2 deployment and a tenant subscription in that deployment

Use Azure PowerShell or Azure CLI to deploy the application. 