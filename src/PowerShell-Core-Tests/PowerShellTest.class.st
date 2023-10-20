Class {
	#name : 'PowerShellTest',
	#superclass : 'TestCase',
	#category : 'PowerShell-Core-Tests-Base',
	#package : 'PowerShell-Core-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
PowerShellTest >> testAllInstalledModules [

	self assert: PowerShell allInstalledModules notEmpty
]

{ #category : 'tests' }
PowerShellTest >> testEdition [

	| editions |
	editions := #('Core' 'Desktop').
	self assert: (editions includes: PowerShell edition)

]

{ #category : 'tests' }
PowerShellTest >> testIsAvailable [

	self assert: PowerShell isAvailable
]
