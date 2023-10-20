"
Abstract superclass for PowerShell objects with a name
"
Class {
	#name : #PSNamedObject,
	#superclass : #PSObject,
	#instVars : [
		'name'
	],
	#category : #'PowerShell-Core-Model'
}

{ #category : #testing }
PSNamedObject class >> isAbstract [

	^ self == PSNamedObject
]

{ #category : #factory }
PSNamedObject class >> named: aName [

	^ PowerShell getInstanceNamed: aName forClass: self
]

{ #category : #'accessing - runtime' }
PSNamedObject class >> powerShellName [
	"Returns the powershell class name"

	^ self name
]

{ #category : #'accessing - runtime' }
PSNamedObject class >> powershellNamedQueryTemplate [
	"Returns the powershell template to query an instance by name"

	^'Get-',self powerShellName, ' -Name ''{1}'' | select-object * | ConvertTo-JSON'
]

{ #category : #accessing }
PSNamedObject >> name [

	^ name
]

{ #category : #accessing }
PSNamedObject >> name: anObject [

	name := anObject
]

{ #category : #printing }
PSNamedObject >> printOn: aStream [

	aStream nextPutAll: self name asString
]
