"
A PSModuleTypeTest is a test class for testing the behavior of PSModuleType
"
Class {
	#name : #PSModuleTypeTest,
	#superclass : #TestCase,
	#pools : [
		'PSModuleType'
	],
	#category : 'PowerShell-Core-Tests-Model'
}

{ #category : #tests }
PSModuleTypeTest >> testBinary [

	self assert: Binary equals: 1
]

{ #category : #tests }
PSModuleTypeTest >> testManifest [

	self assert: Manifest equals: 2
]

{ #category : #tests }
PSModuleTypeTest >> testScript [

	self assert: Script equals: 0
]
