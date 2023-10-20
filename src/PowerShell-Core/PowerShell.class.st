"
Utility class to deal with Powershell interface

#Installation

Run

    PowerShell installOnUbuntuLinux

to make sure the powershell is installed
"
Class {
	#name : 'PowerShell',
	#superclass : 'Object',
	#category : 'PowerShell-Core-Base',
	#package : 'PowerShell-Core',
	#tag : 'Base'
}

{ #category : 'accessing' }
PowerShell class >> allInstalledModuleNames [

	|modules|
	modules := self runCommand: 'Get-Module -ListAvailable | Select-Object Name, Version, Description, ModuleType | ConvertTo-Json'.
	^ (STON fromString: modules) collect: [:each | each at: #Name ]
]

{ #category : 'accessing' }
PowerShell class >> allInstalledModules [

	|modules|
	modules := self runCommand: 'Get-Module -ListAvailable | Select-Object Name, Version, Description, ModuleType | ConvertTo-Json'.
	^ (STON fromString: modules) collect: [:each | PSModule fromDictionary: each ]
]

{ #category : 'private - accessing' }
PowerShell class >> commandTemplate [

	^ Smalltalk os isWindows
			ifTrue: [ '{1} ''{2}''' ]
			ifFalse: [ '{1} -Command ''{2}''' ]
]

{ #category : 'accessing - runtime' }
PowerShell class >> edition [
	"Return the edition of PowerShell runtime"
	<script: 'self edition inspect'>
	
	^ (self runCommand: '$PSEdition') trimBoth
]

{ #category : 'examples' }
PowerShell class >> example [

	(LibC resultOfCommand: 'pwsh -Command "Get-PSRepository | select-object * | ConvertTo-JSON"') inspect
]

{ #category : 'accessing - runtime' }
PowerShell class >> executableName [
	<script: 'self powershellExecutableName inspect'>
	
	^ Smalltalk os isWindows 
			ifTrue: [ ^ 'powershell' ]
			ifFalse:  [ 'pwsh' ]
]

{ #category : 'accessing - runtime' }
PowerShell class >> executablePath [
	<script: 'self powershellExecutablePath inspect'>
	
	Smalltalk os isWindows 
		ifTrue: [ ^LibC resultOfCommand: 'where ', self executableName ].

	Smalltalk os isUnix
		ifTrue: [ ^LibC resultOfCommand: 'which pwsh', self executableName ].

	"Need to be implemented for other platforms"
	self shouldBeImplemented
]

{ #category : 'factory' }
PowerShell class >> getInstanceNamed: aName forClass: aClass [
	"Instantiate a new Pharo instance from the PowerShell twin"

	| psCmd json |
	psCmd := aClass powershellNamedQueryTemplate format: (Array with: aName).
	json := self runCommand: psCmd.
	json ifEmpty: [ self error: 'Not able to instantiate by name' ].
	^ aClass fromJSON: json
]

{ #category : 'installation' }
PowerShell class >> installOnDebian [
	"See https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7"
	<script>

	|termCmd|

	termCmd := PSCommandChainer new
					addCommand: 'sudo apt install snapd';
					addCommand: 'snap install powershell --classic';
					addCommand: 'bash';
					combinedCommand.
	self runGnomeTerminalCommand: termCmd
]

{ #category : 'private - installation' }
PowerShell class >> installOnOutdatedUbuntuLinux [
	"See https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7"
	<script>

	|termCmd|
	termCmd := PSCommandChainer new
				addCommand: 'wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb';
				addCommand: 'sudo dpkg -i packages-microsoft-prod.deb';
				addCommand: 'sudo apt-get update';
				addCommand: 'sudo apt-get install software-properties-common'; "necessary to have add-apt-repository"
				addCommand: 'sudo add-apt-repository universe';
				addCommand: 'bash';
				addCommand: 'sudo apt-get install -y powershell';
				addCommand: 'pwsh';
				addCommand: 'bash';
				combinedCommand.
	self runGnomeTerminalCommand: termCmd
]

{ #category : 'installation' }
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

{ #category : 'testing' }
PowerShell class >> isAvailable [

	^ self isInstalled 
]

{ #category : 'testing' }
PowerShell class >> isInstalled [

	Smalltalk os isWindows 
		ifTrue: [ ^(LibC resultOfCommand: 'where powershell') notEmpty ].

	Smalltalk os isUnix
		ifTrue: [ ^(LibC resultOfCommand: 'pwsh -v') includesSubstring: 'PowerShell' ].

	"Need to be implemented for other platforms"
	self shouldBeImplemented
]

{ #category : 'accessing - runtime' }
PowerShell class >> powershellExecutablePath [
	<script: 'self powershellExecutablePath inspect'>
	
	Smalltalk os isWindows 
		ifTrue: [ ^LibC resultOfCommand: 'where ', self executableName ].

	Smalltalk os isUnix
		ifTrue: [ ^LibC resultOfCommand: 'which pwsh', self executableName ].

	"Need to be implemented for other platforms"
	self shouldBeImplemented
]

{ #category : 'utilities' }
PowerShell class >> resultOfCommand: aCommand [

	^ Smalltalk os resultOfCommand: aCommand 
]

{ #category : 'utilities' }
PowerShell class >> runCommand: aCommand [

	| cmdLine |
	cmdLine := self commandTemplate format: (Array with: self executableName with: aCommand).
	^ self resultOfCommand: cmdLine
]

{ #category : 'private - utilities' }
PowerShell class >> runGnomeTerminalCommand: terminalCommandString [
	|cmd|
	cmd := 'gnome-terminal --working-directory={1} --title="Installing Powershell" -x bash -c "{2}"'
				format: { FileSystem workingDirectory fullName. terminalCommandString}.
	LibC system: cmd
]

{ #category : 'accessing - runtime' }
PowerShell class >> version [
	"Return the version of PowerShell runtime"
	<script: 'self version inspect'>
	
	| jsonString |
	jsonString := self runCommand: '$PSVersionTable.PSVersion | ConvertTo-Json'.
	^ PSVersion fromJSON: jsonString
]
