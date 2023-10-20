"
A PSSecureStringTest is a test class for testing the behavior of PSSecureString
"
Class {
	#name : 'PSSecureStringTest',
	#superclass : 'TestCase',
	#category : 'PowerShell-Core-Tests-Security',
	#package : 'PowerShell-Core-Tests',
	#tag : 'Security'
}

{ #category : 'tests' }
PSSecureStringTest >> testGetSecureString [

	self assert: (PSSecureString getSecureStringForPassword: 'mySecretPassword') size equals: 525
]