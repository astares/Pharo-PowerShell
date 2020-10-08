Class {
	#name : #PowerShellTest,
	#superclass : #TestCase,
	#category : #'PowerShell-Core-Tests-Base'
}

{ #category : #tests }
PowerShellTest >> testIsAvailable [

	self assert: PowerShell isAvailable 
]
