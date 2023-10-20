"
A secure string
"
Class {
	#name : #PSSecureString,
	#superclass : #Object,
	#category : #'PowerShell-Core-Security'
}

{ #category : #accessing }
PSSecureString class >> getSecureStringForPassword: aPassword [

	^ PowerShell runCommand: '''', aPassword,''' | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString'
]
