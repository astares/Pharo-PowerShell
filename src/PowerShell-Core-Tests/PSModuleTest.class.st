"
A PSModuleTest is a test class for testing the behavior of PSModule
"
Class {
	#name : #PSModuleTest,
	#superclass : #TestCase,
	#instVars : [
		'module'
	],
	#category : #'PowerShell-Core-Tests-Model'
}

{ #category : #running }
PSModuleTest >> setUp [

	super setUp.
	module := PSModule new
]

{ #category : #tests }
PSModuleTest >> testIsBinary [

	module moduleType: 1.
	
	self assert: module isBinary
]

{ #category : #tests }
PSModuleTest >> testIsManifest [

	module moduleType: 2.
	
	self assert: module isManifest
]

{ #category : #tests }
PSModuleTest >> testIsScript [

	module moduleType: 0.
	
	self assert: module isScript
]

{ #category : #tests }
PSModuleTest >> testPackageManagementAvailable [

	self assert: (PSModule named: 'PackageManagement') notNil
]

{ #category : #tests }
PSModuleTest >> testPowerShellName [

	self assert: PSModule powerShellName equals: 'Module'
]
