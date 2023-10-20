"
A class to represent PowerShell modules
"
Class {
	#name : 'PSModule',
	#superclass : 'PSObject',
	#instVars : [
		'name',
		'version',
		'description'
	],
	#category : 'PowerShell-Core-Model',
	#package : 'PowerShell-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
PSModule class >> fromDictionary: aDictionary [ 
	
	| module |
	module := self new.
	module name: (aDictionary at: #Name ifAbsent: '').
	module version: (PSVersion fromDictionary: (aDictionary at: #Version ifAbsent: Dictionary new)).	
	module description: (aDictionary at: #Description ifAbsent: '').
	^ module
]

{ #category : 'accessing' }
PSModule >> description [

	^ description
]

{ #category : 'accessing' }
PSModule >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
PSModule >> name [

	^ name
]

{ #category : 'accessing' }
PSModule >> name: anObject [

	name := anObject
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
