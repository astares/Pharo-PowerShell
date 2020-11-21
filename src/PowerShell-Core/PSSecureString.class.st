Class {
	#name : #PSSecureString,
	#superclass : #Object,
	#category : #'PowerShell-Core-Security'
}

{ #category : #accessing }
PSSecureString class >> getSecureStringForPassword: aPassword [

	^LibC resultOfCommand: 'powershell -c " ''', aPassword,''' | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString"'
]
