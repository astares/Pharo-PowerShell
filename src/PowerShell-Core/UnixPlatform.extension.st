Extension { #name : #UnixPlatform }

{ #category : #'*PowerShell-Core' }
UnixPlatform >> isUbuntu [
	^self isLinux and: [ 
		(LibC resultOfCommand: 'lsb_release -i') includesSubstring: 'Ubuntu'
	]
]
