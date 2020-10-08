"
Utility class to deal with Powershell interface

#Installation

Run

    PowerShell installOnUbuntuLinux

to make sure the powershell is installed
"
Class {
	#name : #PowerShell,
	#superclass : #Object,
	#category : #'PowerShell-Core-Base'
}

{ #category : #'private - installation' }
PowerShell class >> installOnOutdatedUbuntuLinux [	
	"See https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7"
	<script>
	
	|termCmd|
	termCmd := PSCommandChainer new
				addCommand: 'wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb';
				addCommand: 'sudo dpkg -i packages-microsoft-prod.deb';
				addCommand: 'sudo apt-get update';
				addCommand: 'sudo add-apt-repository universe';
				addCommand: 'bash';
				addCommand: 'sudo apt-get install -y powershell';
				addCommand: 'pwsh';
				addCommand: 'bash';
				combinedCommand.				
	self runGnomeTerminalCommand: termCmd  				
				
								
				
]

{ #category : #installation }
PowerShell class >> installOnUbuntuLinux [	
	"See https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7"
	<script>

	|termCmd|
		
	(Smalltalk os linuxDistributionReleaseVersion asNumber < 20)
		ifTrue: [ ^self installOnOutdatedUbuntuLinux ].
		
	termCmd := PSCommandChainer new
					addCommand: 'snap install powershell --classic';				
					addCommand: 'bash';
					combinedCommand.				
	self runGnomeTerminalCommand: termCmd  					
		 
				
								
				
]

{ #category : #testing }
PowerShell class >> isAvailable [
	self shouldBeImplemented.
]

{ #category : #'private - utilities' }
PowerShell class >> runGnomeTerminalCommand: terminalCommandString [  
	|cmd|
	cmd := 'gnome-terminal --working-directory={1} --title="Installing Powershell" -x bash -c "{2}"'
				format: { FileSystem workingDirectory fullName. terminalCommandString}.
	LibC system: cmd		 
]
