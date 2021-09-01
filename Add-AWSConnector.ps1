Clear-Host
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$ErrorActionPreference = 'Stop'

$Config     = (Get-Content "$PSScriptRoot\DS-Config.json" -Raw) | ConvertFrom-Json
$Manager    = $Config.MANAGER
$Port       = $Config.PORT
$APIKEY     = $Config.APIKEY

$AWS_Config     = (Get-Content "$PSScriptRoot\AWS-Config.json" -Raw) | ConvertFrom-Json
$displayName  = $AWS_Config.displayName
$useInstanceRole  = $AWS_Config.useInstanceRole
$crossAccountRoleArn = $AWS_Config.crossAccountRoleArn

$StartTime  = $(get-date)

$DSM_URI                = "https://" + $Manager + ":" + $Port
$AWSConnectors_apipath  = "/api/awsconnectors"
$AWSConnectors_Uri      = $DSM_URI + $AWSConnectors_apipath

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("api-secret-key", $APIKEY)
$headers.Add("api-version", 'v1')
$Headers.Add("Content-Type", 'application/json')

$new_AWSConnector = [pscustomobject]@{
    displayName = $displayName
    useInstanceRole = $useInstanceRole
    crossAccountRoleArn = $crossAccountRoleArn
    }    
$new_AWSConnector_Payload = $new_AWSConnector | ConvertTo-Json

try {
    Invoke-RestMethod -Uri $AWSConnectors_Uri -Method Post -Headers $Headers -Body $new_AWSConnector_Payload
    Write-Host "[INFO]  AWS Connection Creation Successful"
}
catch {
    Write-Host "[ERROR]	Failed to create the connector.	$_"
    Exit
}

$elapsedTime    = $(get-date) - $StartTime
$totalTime      = "{0:HH:mm:ss}" -f ([datetime]$elapsedTime.Ticks)
Write-Host "Script Execution is Complete.  It took $totalTime"
