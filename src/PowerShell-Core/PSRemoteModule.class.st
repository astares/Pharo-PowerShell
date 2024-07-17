"
A remote module from a remote repository
"
Class {
	#name : 'PSRemoteModule',
	#superclass : 'PSNamedObject',
	#instVars : [
		'version',
		'type',
		'description',
		'author',
		'companyName',
		'copyright',
		'publishedDate',
		'installedDate',
		'updatedDate',
		'licenseUri',
		'projectUri',
		'iconUri'
	],
	#category : 'PowerShell-Core-Model',
	#package : 'PowerShell-Core',
	#tag : 'Model'
}

{ #category : 'accessing - runtime' }
PSRemoteModule class >> powershellNamedQueryTemplate [
	"Returns the powershell template to query an instance by name"

	^'Find-Module -Repository PSGallery -Name ''{1}'' | select-object * | ConvertTo-JSON'
]

{ #category : 'accessing' }
PSRemoteModule >> author [

	^ author
]

{ #category : 'accessing' }
PSRemoteModule >> author: anObject [

	author := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> companyName [

	^ companyName
]

{ #category : 'accessing' }
PSRemoteModule >> companyName: anObject [

	companyName := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> copyright [

	^ copyright
]

{ #category : 'accessing' }
PSRemoteModule >> copyright: anObject [

	copyright := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> description [

	^ description
]

{ #category : 'accessing' }
PSRemoteModule >> description: anObject [

	description := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> iconUri [

	^ iconUri
]

{ #category : 'accessing' }
PSRemoteModule >> iconUri: anObject [

	iconUri := anObject
]

{ #category : 'private - initialization' }
PSRemoteModule >> initFromDictionary: aDictionary [
	"Initializes the receiver from the given dictionary"

	self
		name: (aDictionary at: #Name ifAbsent: '');
		version: (aDictionary at: #Version ifAbsent: '');
		type: (aDictionary at: #Type ifAbsent: '');
		description: (aDictionary at: #Description ifAbsent: '');
		author: (aDictionary at: #Author ifAbsent: '');
		companyName: (aDictionary at: #CompanyName ifAbsent: '');
		copyright: (aDictionary at: #Copyright ifAbsent: '')	;
		publishedDate: (aDictionary at: #PublishedDate ifAbsent: '');
		installedDate: (aDictionary at: #InstalledDate ifAbsent: '');
		updatedDate: (aDictionary at: #UpdatedDate ifAbsent: '');
		licenseUri: (aDictionary at: #LicenseUri ifAbsent: '');
		projectUri: 	(aDictionary at: #ProjectUri ifAbsent: '');
		iconUri: 	(aDictionary at: #IconUri ifAbsent: '')
]

{ #category : 'accessing' }
PSRemoteModule >> installedDate [

	^ installedDate
]

{ #category : 'accessing' }
PSRemoteModule >> installedDate: anObject [

	installedDate := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> licenseUri [

	^ licenseUri
]

{ #category : 'accessing' }
PSRemoteModule >> licenseUri: anObject [

	licenseUri := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> projectUri [

	^ projectUri
]

{ #category : 'accessing' }
PSRemoteModule >> projectUri: anObject [

	projectUri := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> publishedDate [

	^ publishedDate
]

{ #category : 'accessing' }
PSRemoteModule >> publishedDate: anObject [

	publishedDate := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> type [

	^ type
]

{ #category : 'accessing' }
PSRemoteModule >> type: anObject [

	type := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> updatedDate [

	^ updatedDate
]

{ #category : 'accessing' }
PSRemoteModule >> updatedDate: anObject [

	updatedDate := anObject
]

{ #category : 'accessing' }
PSRemoteModule >> version [

	^ version
]

{ #category : 'accessing' }
PSRemoteModule >> version: anObject [

	version := anObject
]
