"
A PSObjectTest is a test class for testing the behavior of PSObject
"
Class {
	#name : #PSObjectTest,
	#superclass : #TestCase,
	#category : #'PowerShell-Core-Tests-Model'
}

{ #category : #tests }
PSObjectTest >> testIsAbstract [

	self assert: PSObject isAbstract 
]
