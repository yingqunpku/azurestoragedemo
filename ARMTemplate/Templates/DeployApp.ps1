﻿Configuration DeployApp
{
  param ($MachineName, $storageEndpoint)

  Node $MachineName
  {
    Package NodeJS
    {
        Ensure = "Present"
        Path = "https://nodejs.org/dist/v6.5.0/node-v6.5.0-x64.msi"
        Name = "Node.js"
        Arguments = "/log C:\nodeInstallLog.txt ALLUSERS=1"
        ProductId = "DF97B44B-C53A-4B9E-BC85-5F985DC2B343"
    }

    Script AppDownload {
        SetScript = {
            $source = "https://armtemplate.blob.core.windows.net/bin/acsdemo.zip"
            $destination = "c:\web\acsdemo.zip"
            new-item -itemtype directory -Path "c:\web\"
            Invoke-WebRequest $source -OutFile $destination
        }
        TestScript = { return $false }
        GetScript = {@{ Result = "True" }}
        DependsOn = "[Package]NodeJS"
    }

    Archive AppExtract {
        Ensure = "Present"
        Path = "c:\web\acsdemo.zip"
        Destination = "c:\web\"
        DependsOn="[Script]AppDownload"
    }

    File TestFile
    {
        Ensure = "Present"
        DestinationPath = "C:\web\install.txt"
        Contents = "Hello there ! $storageEndpoint Welcome to $MachineName!"
    }

    Script EnvPrep
    {
        SetScript = {
            cd c:\web\

            $env:Path += ";C:\Program Files\nodejs\;"            
            $str = [Environment]::ExpandEnvironmentVariables("%appdata%")
            [Environment]::SetEnvironmentVariable("Node_Path", $str+"\npm\", "Machine")
            $env:Path += $str+"\npm\"
            [Environment]::SetEnvironmentVariable("Path", $env:Path, "Machine")
	        [Environment]::SetEnvironmentVariable("NODE_TLS_REJECT_UNAUTHORIZED", "0", "Machine")
            npm install supervisor@0.11.0 -g -s
            npm install -s
	        netsh advfirewall firewall add rule name="Node.js HTTP" dir=in action=allow protocol=TCP localport=3000
        }
        TestScript = { return $false }
        GetScript = {@{ Result = "True" }}
        DependsOn = "[Script]AppDownload"
    }

    Script RunApp
    {
        SetScript = {
            cd c:\web\            
            Start-Process run.cmd
        }
        TestScript = { return $false }
        GetScript = {@{ Result = "True" }}
        DependsOn = @("[Script]EnvPrep", "[Archive]AppExtract")
    }
  } 
}