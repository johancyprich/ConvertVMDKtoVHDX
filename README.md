PowerShell-Template
===================

This is a template that I use when I create a PowerShell script. It includes code for linking external libraries, displaying the application name/version and copyright/license, help screens, and command line parameter handling.

Requirements
============
PowerShell 5.x or higher. The template use a class and only PowerShell from this version onwards support this functionality.

Usage
=====
The Main section (i.e. #=[ MAIN ]=== is where you add the main body of your code. The code begins by instantiating AppInfo with $app. This displays the program info (name, version, license) and help screen if its requested. The main body ends with $app.QuitProgram($true, $true) which displays the script execution time and Done message (both are optional).

You need to define the contents of the help screen in the HelpScreen function. This is called by DisplayHelp in the AppInfo class. The command line parameters to call help is ? or help.