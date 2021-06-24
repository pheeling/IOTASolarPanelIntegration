$Global:mainPath = split-path -path $MyInvocation.MyCommand.Definition 
$Global:resourcespath = join-path -path "$mainPath" -ChildPath "resources"
$Global:myStromIntegrationPath = Join-Path -Path "$mainPath" -ChildPath "myStromIntegration"
$Global:errorVariable = "Stop"
$Global:logFile = "$resourcespath\processing.log"
$Global:XflexInterfaceLog = "$resourcespath\XflexInterface.log"

#Requirementcheck

Import-Module -Force "$myStromIntegrationPath\myStromAPI.psm1"
Import-Module -Force "$resourcespath\Messages.psm1"
Import-Module -Force "$resourcespath\NodeConfiguration.psm1"

"$(Get-Date) [START] script" >> $Global:logFile

$solarSensor = Get-MyStrom
$solarSensor.getData("mystrom-switch-43f2b8","help")
$result = $solarSensor.getData("mystrom-switch-43f2b8","report")
$result
