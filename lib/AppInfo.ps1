class AppInfo
{
	$_cmd = ""				# command line parameter
	$_xml = ""				# Settings.xml
	$_startDate = ""		# start date when script started running
	
	$ExitScript = $false	# stop running script?

	###############################################################################################
	# Constructor
	###############################################################################################

	AppInfo ($cmd, $xml)
	{
		$this._cmd = $cmd
		$this._xml = $xml

		$this._startDate = Get-Date

		# Display program info and help screen (if requested)

		$this.WriteProgramInfo()
		$this.DisplayHelp()
	}

	
	###############################################################################################
	# SUMMARY:
	# Display help screen when user enters "?" or "help". Calls function HelpScreen which user
	# defines the content of the application help.
	#
	# PARAMETERS:
	# $global:cmd (in) - Command line parameters.
	###############################################################################################

 	DisplayHelp ()
	{
		if (($this._cmd -eq "?") -or ($this._cmd -eq "help"))
		{
			HelpScreen

			$this.ExitScript = $true
		}
	} # DisplayHelp


	###############################################################################################
	# SUMMARY:
	# Writes the name of the app, copyright, and license. If $copyright is blank, then only the app
	# name will be displayed. License will be displayed if its not an empty string.
	#
	# PARAMETERS:
	# $appName (in) - Name of the app.
	# $copyright (in) -  Year and copyright name.
	###############################################################################################

 	WriteProgramInfo ()
	{
		[string] $appName = $this._xml.Settings.Application.Name + " " + $this._xml.Settings.Application.Version
		[string] $copyright = $this._xml.Settings.Application.Legal.Copyright
		[string] $license = $this._xml.Settings.Application.Legal.License

		Write-Host
		Write-Host -BackgroundColor Black -ForegroundColor White $appName

		if ($copyright -ne "")
		{
			Write-Host "Copyright (C) $copyright. All rights reserved. "

			if ($license -ne "") { Write-Host $license }
		}

		Write-Host "---"
		Write-Host
	} # WriteProgramInfo


	###############################################################################################
	# SUMMARY:
	# Display the running time of the script and the closing Done message.
	#
	# PARAMETERS:
	# $runningTime (in) - display running time?
	# $doneMessage (in) - display Done message?
	###############################################################################################

	QuitProgram ([bool] $runningTime, [bool] $doneMessage)
	{
		if ($runningTime)
		{
			Write-Host
			Write-Host -ForegroundColor Green "Running time:" $($(Get-Date) - $this._startDate)		
		}

		if ($doneMessage)
		{
			Write-Host
			Write-Host " Done " -ForegroundColor White -BackgroundColor DarkRed
		}

		Write-Host	
	}
} # AppInfo