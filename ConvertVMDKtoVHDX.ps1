# ConvertVMDKtoVHDX
# See Settings.xml for application, user, and license information.
#
# SUMMARY:
# Converts a .vmdk to .vhdx for Hyper-V. Install "Microsoft Virtual Machine Converter 3.0" in order
# to use the Powershell module. Run script as Powershell administrator.
#
# USAGE:
# ./ConvertVMDKtoVHDX [sourceFile] [destinationPath]
#
# EXAMPLE:
# ./ConvertVMDKtoVHDX "D:\VM\bitnami-joomla-3.9.10-0-linux-debian-9-x86_64.vmdk" "D:\VM"
#
# REQUIREMENTS:
# PowerShell 5.x or higher
# 
# REFERENCES:
# How to Convert a VMWare VMDK to Hyper-V VHD
# https://blogs.msdn.microsoft.com/timomta/2015/06/11/how-to-convert-a-vmware-vmdk-to-hyper-v-vhd/
# 
# Microsoft Virtual Machine Converter 3.0
# https://www.microsoft.com/en-us/download/confirmation.aspx?id=42497

param
(
	[string] $sourceFile,
	[string] $destinationPath
)


#=[ APPINFO ]======================================================================================

# Example for accessing data: $xml.Settings.Application.Name

$xml = [xml](get-content $PSScriptRoot\Settings.xml)    # Settings.xml located in the script folder.


#=[ LIBRARIES ]=====================================================================================

[string] $lib = "$PSScriptRoot\lib\"

."$lib\AppInfo.ps1"

Import-Module 'C:\Program Files\Microsoft Virtual Machine Converter\MvmcCmdlet.psd1'


#=[ FUNCTIONS ]=====================================================================================

function HelpScreen
{
	Write-Host "Usage:" $xml.Settings.Application.Name
	Write-Host 
}


#=[ MAIN ]==========================================================================================

# Display application info and help.

$app = New-Object -TypeName AppInfo ($cmd, $xml)
if ($app.ExitScript) { exit }

# Convert VM.

ConvertTo-MvmcVirtualHardDisk -SourceLiteralPath $sourceFile -VhdType DynamicHardDisk -VhdFormat vhdx -destination $destinationPath

# Quit the program.

$app.QuitProgram($true, $true)