"
A secure string
"
Class {
	#name : 'PSSecureString',
	#superclass : 'Object',
	#category : 'PowerShell-Core-Security',
	#package : 'PowerShell-Core',
	#tag : 'Security'
}

{ #category : 'accessing' }
PSSecureString class >> getSecureStringForPassword: aPassword [

	^ PowerShell runCommand: '''', aPassword,''' | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString'
]
