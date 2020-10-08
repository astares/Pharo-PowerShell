Extension { #name : #UnixPlatform }

{ #category : #'*PowerShell-Core' }
UnixPlatform >> isFedora [
	"Return true if the receiver is Fedora"
	
	^self isLinuxDistributionWithName: 'Fedora'
]

{ #category : #'*PowerShell-Core' }
UnixPlatform >> isLinuxDistributionWithName: linuxDistributionName [
	"Check if the installed OS is a Linux with the given name like 'Ubuntu', 'Debian' or 'Fedora'"
	
	^self isLinux and: [ 
		'/etc/os-release' asFileReference contents includesSubstring: linuxDistributionName ]
]

{ #category : #'*PowerShell-Core' }
UnixPlatform >> isUbuntu [
	"Return true if the receiver is Ubuntu"
	
	^self isLinuxDistributionWithName: 'Ubuntu'
]

{ #category : #'*PowerShell-Core' }
UnixPlatform >> kernelReleaseVersion [ 
	"Return the Kernel release version of the given Unix"
	
	^LibC resultOfCommand: 'uname -rv'
]

{ #category : #'*PowerShell-Core' }
UnixPlatform >> linuxDistributionReleaseVersion [
	"Returns the LSB Release number (which is only found on Debian and Ubuntu) or
	 the gentoo release number on Gentoo, RedHat, Arch & SuSE"
		
	self isUbuntu ifTrue: [ ^(LibC resultOfCommand: 'lsb_release -r') substrings second ].

	"Need to be implemented for other dialects too"
	self shouldBeImplemented 
]
