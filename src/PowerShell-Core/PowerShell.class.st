Class {
	#name : #PowerShell,
	#superclass : #Object,
	#category : #'PowerShell-Core-Base'
}

{ #category : #installation }
PowerShell class >> installOnUbuntuLinux [	
	"See https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7"
	<script>
	
	|termCmd cmd|
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
	cmd := 'gnome-terminal --working-directory={1} --title="Hello" -x bash -c "{2}"'
				format: { FileSystem workingDirectory fullName. termCmd}.
	LibC system: cmd		 				
				
								
				
]

{ #category : #testing }
PowerShell class >> isAvailable [
	self shouldBeImplemented.
]
