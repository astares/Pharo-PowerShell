"
A class to represent PowerShell modules
"
Class {
	#name : 'PSModule',
	#superclass : 'PSNamedObject',
	#instVars : [
		'version',
		'description',
		'path'
	],
	#category : 'PowerShell-Core-Model',
	#package : 'PowerShell-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
PSModule class >> powerShellName [

	^ 'Module'
]

{ #category : 'accessing' }
PSModule >> description [

	^ description
]

{ #category : 'accessing' }
PSModule >> description: anObject [

	description := anObject
]

{ #category : 'private - initialization' }
PSModule >> initFromDictionary: aDictionary [
	"Initializes the receiver from the given dictionary"

	self
		name: (aDictionary at: #Name ifAbsent: '');
		version: (PSVersion fromDictionary: (aDictionary at: #Version ifAbsent: Dictionary new));
		description: (aDictionary at: #Description ifAbsent: '');
		path: (aDictionary at: #Path ifAbsent: '')
]

{ #category : 'accessing' }
PSModule >> path [

	^ path
]

{ #category : 'accessing' }
PSModule >> path: anObject [

	path := anObject
]

{ #category : 'printing' }
PSModule >> printOn: aStream [

	aStream nextPutAll: self name asString
]

{ #category : 'accessing' }
PSModule >> version [

	^ version
]

{ #category : 'accessing' }
PSModule >> version: anObject [

	version := anObject
]
