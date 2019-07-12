ConvertVMDKtoVHDX
===================

Converts a .vmdk to .vhdx for Hyper-V. Install "Microsoft Virtual Machine Converter 3.0" in order
to use the Powershell module. Run script as Powershell administrator.

Usage
=====
./ConvertVMDKtoVHDX [sourceFile] [destinationPath]

Example
=======
./ConvertVMDKtoVHDX "D:\VM\bitnami-joomla-3.9.10-0-linux-debian-9-x86_64.vmdk" "D:\VM"

Requirements
============
PowerShell 5.x or higher. The template use a class and only PowerShell from this version onwards support this functionality.

References
==========
How to Convert a VMWare VMDK to Hyper-V VHD
https://blogs.msdn.microsoft.com/timomta/2015/06/11/how-to-convert-a-vmware-vmdk-to-hyper-v-vhd/

Microsoft Virtual Machine Converter 3.0
https://www.microsoft.com/en-us/download/confirmation.aspx?id=42497
