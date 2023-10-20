"
A PSNamedObjectTest is a test class for testing the behavior of PSNamedObject
"
Class {
	#name : #PSNamedObjectTest,
	#superclass : #TestCase,
	#category : 'PowerShell-Core-Tests-Model'
}

{ #category : #tests }
PSNamedObjectTest >> testIsAbstract [

	self assert: PSNamedObject isAbstract
]
