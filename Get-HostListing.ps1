# +------------------------------------------------------+
# |        Load VMware modules if not loaded             |
# +------------------------------------------------------+
"Loading VMWare Modules"
$ErrorActionPreference="SilentlyContinue" 
if ( !(Get-Module -Name VMware.VimAutomation.Core -ErrorAction SilentlyContinue) ) {
    if (Test-Path -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\VMware, Inc.\VMware vSphere PowerCLI' ) {
        $Regkey = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\VMware, Inc.\VMware vSphere PowerCLI'
       
    } else {
        $Regkey = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\VMware, Inc.\VMware vSphere PowerCLI'
    }
    . (join-path -path (Get-ItemProperty  $Regkey).InstallPath -childpath 'Scripts\Initialize-PowerCLIEnvironment.ps1')
}
$ErrorActionPreference="Continue"

# -----------------------
# Define Global Variables
# -----------------------
$Global:Folder = $env:USERPROFILE+"\Documents\vCenterHostListings" 
$Global:HostList = $null
$Global:VCName = $null
$Global:Creds = $null



#*****************
# Get VC from User
#*****************
Function Get-VCenter {
    [CmdletBinding()]
    Param()
    #Prompt User for vCenter
    Write-Host "Enter the FQHN of the vCenter that the host currently resides in: " -ForegroundColor "Yellow" -NoNewline
    $Global:VCName = Read-Host 
}
#*******************
# EndFunction Get-VC
#*******************

#*************************************************
# Check for Folder Structure if not present create
#*************************************************
Function Verify-Folders {
    [CmdletBinding()]
    Param()
    "Building Local folder structure" 
    If (!(Test-Path $Global:Folder)) {
        New-Item $Global:Folder -type Directory
  <#      New-Item "$Global:WorkFolder\Annotations" -type Directory
        New-Item "$Global:WorkFolder\IPConfig" -type Directory
        New-Item "$Global:WorkFolder\ShareInfo" -type Directory
        New-Item "$Global:WorkFolder\VMInfo" -type Directory
        New-Item "$Global:WorkFolder\PrinterInfo" -type Directory
    #>
        }
    "Folder Structure built" 
}
#***************************
# EndFunction Verify-Folders
#***************************

#*******************
# Connect to vCenter
#*******************
Function Connect-VC {
    [CmdletBinding()]
    Param()
    "Connecting to $Global:VCName"
    Connect-VIServer $Global:VCName -Credential $Global:Creds -WarningAction SilentlyContinue
}
#***********************
# EndFunction Connect-VC
#***********************

#*******************
# Disconnect vCenter
#*******************
Function Disconnect-VC {
    [CmdletBinding()]
    Param()
    "Disconnecting $Global:VCName"
    Disconnect-VIServer -Server $Global:VCName -Confirm:$false
}
#**************************
# EndFunction Disconnect-VC
#**************************


#*********************
# Clean Up after Run
#*********************
Function Clean-Up {
    [CmdletBinding()]
    Param()
    $Global:Folder = $null
    $Global:HostList = $null
    $Global:VCName = $null
    $Global:Creds = $null
}
#*********************
# EndFunction Clean-Up
#*********************

#**********************
# Function Get-HostList
#**********************
Function Get-HostList {
    [CmdletBinding()]
    Param()
    "Retrieving HostList from $Global:VCname"
    #$Global:HostList = Get-VMhost | where {$_.ConnectionState -eq "Connected"} | Get-VMHostHardware | Select VMHost, Manufacturer, Model, SerialNumber
    $Global:HostList = Get-View -ViewType Hostsystem | Select `
        Name, `
        @{N="State";E={$_.RunTime.ConnectionState}}, `
        @{N="Vendor";E={$_.Hardware.systemInfo.Vendor}}, `
        @{N="Model";e={$_.Hardware.SystemInfo.Model}}, `
        @{Name="Serial#"; E={($_.Hardware.SystemInfo.OtherIdentifyingInfo | Where {$_.IdentifierType.Key -eq "ServiceTag"}).IdentifierValue}}, `
        @{N="Product";E={$_.Config.Product.Name}}, `
        @{N="Version";E={$_.Config.Product.Version}}, `
        @{N="Build";E={$_.Config.Product.Build}}
}
#*************************
# EndFunction Get-HostList
#*************************

#**********************
# Function Write-to-CSV
#**********************
Function Write-to-CSV {
    [CmdletBinding()]
    Param()
    "Writing HostList from $Global:VCname to CSV"
    $Global:HostList | Export-CSV -Path $Global:Folder\$Global:VCname-HostList.csv -NoTypeInformation


}
#*************************
# EndFunction Write-to-CSV
#*************************


#**************************
# Function Convert-To-Excel
#**************************
Function Convert-To-Excel {
    [CmdletBinding()]
    Param()
   "Converting HostList from $Global:VCname to Excel"
    $workingdir = $Global:Folder+ "\*.csv"
    $csv = dir -path $workingdir

    foreach($inputCSV in $csv){
        $outputXLSX = $inputCSV.DirectoryName + "\" + $inputCSV.Basename + ".xlsx"
        ### Create a new Excel Workbook with one empty sheet
        $excel = New-Object -ComObject excel.application 
        $excel.DisplayAlerts = $False
        $workbook = $excel.Workbooks.Add(1)
        $worksheet = $workbook.worksheets.Item(1)

        ### Build the QueryTables.Add command
        ### QueryTables does the same as when clicking "Data » From Text" in Excel
        $TxtConnector = ("TEXT;" + $inputCSV)
        $Connector = $worksheet.QueryTables.add($TxtConnector,$worksheet.Range("A1"))
        $query = $worksheet.QueryTables.item($Connector.name)


        ### Set the delimiter (, or ;) according to your regional settings
        ### $Excel.Application.International(3) = ,
        ### $Excel.Application.International(5) = ;
        $query.TextFileOtherDelimiter = $Excel.Application.International(5)

        ### Set the format to delimited and text for every column
        ### A trick to create an array of 2s is used with the preceding comma
        $query.TextFileParseType  = 1
        $query.TextFileColumnDataTypes = ,2 * $worksheet.Cells.Columns.Count
        $query.AdjustColumnWidth = 1

        ### Execute & delete the import query
        $query.Refresh()
        $query.Delete()

        ### Save & close the Workbook as XLSX. Change the output extension for Excel 2003
        $Workbook.SaveAs($outputXLSX,51)
        $excel.Quit()
    }
    ## To exclude an item, use the '-exclude' parameter (wildcards if needed)
    remove-item -path $workingdir 

}
#*****************************
# EndFunction Convert-To-Excel
#*****************************

#***************
# Execute Script
#***************
CLS
$ErrorActionPreference="SilentlyContinue"

"================================================="
" "
Write-Host "Get CIHS credentials" -ForegroundColor Yellow
$Global:Creds = Get-Credential -Credential $null

Get-VCenter
Connect-VC
"-------------------------------------------------"
Verify-Folders
"-------------------------------------------------"
Get-HostList
"-------------------------------------------------"
Write-to-CSV
"-------------------------------------------------"
Convert-To-Excel
"-------------------------------------------------"
Disconnect-VC
"Open Explorer to $Global:Folder"
Invoke-Item $Global:Folder
Clean-Up

