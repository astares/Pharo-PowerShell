"
A class to represent PowerShell modules
"
Class {
	#name : #PSModule,
	#superclass : #PSNamedObject,
	#instVars : [
		'version',
		'description',
		'path',
		'moduleType'
	],
	#pools : [
		'PSModuleType'
	],
	#category : #'PowerShell-Core-Model'
}

{ #category : #examples }
PSModule class >> packageManagement [
	<sampleInstance>

	^ self named: 'PackageManagement'
]

{ #category : #'accessing - runtime' }
PSModule class >> powerShellName [

	^ 'Module'
]

{ #category : #'accessing - runtime' }
PSModule class >> powershellNamedQueryTemplate [
	"Returns the powershell template to query an instance by name.

	 If you want all choose select-object *"

	^'Get-',self powerShellName, ' -ListAvailable -Name "{1}" | select-object Name, Version, Description, Path, ModuleType | ConvertTo-JSON'
]

{ #category : #accessing }
PSModule >> description [

	^ description
]

{ #category : #accessing }
PSModule >> description: anObject [

	description := anObject
]

{ #category : #'private - initialization' }
PSModule >> initFromDictionary: aDictionary [
	"Initializes the receiver from the given dictionary"

	self
		name: (aDictionary at: #Name ifAbsent: '');
		version: (PSVersion fromDictionary: (aDictionary at: #Version ifAbsent: Dictionary new));
		description: (aDictionary at: #Description ifAbsent: '');
		path: (aDictionary at: #Path ifAbsent: '');
		moduleType: (aDictionary at: #ModuleType ifAbsent: 0)
]

{ #category : #testing }
PSModule >> isBinary [

	^ self moduleType = Binary
]

{ #category : #testing }
PSModule >> isManifest [

	^ self moduleType = Manifest
]

{ #category : #testing }
PSModule >> isScript [

	^ self moduleType = Script
]

{ #category : #accessing }
PSModule >> moduleType [

	^ moduleType
]

{ #category : #accessing }
PSModule >> moduleType: anObject [

	moduleType := anObject
]

{ #category : #accessing }
PSModule >> path [

	^ path
]

{ #category : #accessing }
PSModule >> path: anObject [

	path := anObject
]

{ #category : #accessing }
PSModule >> version [

	^ version
]

{ #category : #accessing }
PSModule >> version: anObject [

	version := anObject
]
