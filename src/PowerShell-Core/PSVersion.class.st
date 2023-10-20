"
This class reflects a PowerShell version
"
Class {
	#name : #PSVersion,
	#superclass : #PSObject,
	#instVars : [
		'major',
		'minor',
		'build',
		'revision',
		'majorRevision',
		'minorRevision'
	],
	#category : #'PowerShell-Core-Model'
}

{ #category : #'instance creation' }
PSVersion class >> fromDictionary: aDictionary [ 
	
	| version |
	version := self new.
	version major: (aDictionary at: #Major ifAbsent: 0).
	version minor: (aDictionary at: #Minor ifAbsent: 0).
	version build: (aDictionary at: #Build ifAbsent: 0).
	version revision: (aDictionary at: #Revision ifAbsent: 0).
	version majorRevision: (aDictionary at: #MajorRevision ifAbsent: 0).				
	version minorRevision: (aDictionary at: #MinorRevision ifAbsent: 0).									
	^ version
]

{ #category : #accessing }
PSVersion >> build [

	^ build
]

{ #category : #accessing }
PSVersion >> build: anObject [

	build := anObject
]

{ #category : #accessing }
PSVersion >> major [

	^ major
]

{ #category : #accessing }
PSVersion >> major: anObject [

	major := anObject
]

{ #category : #accessing }
PSVersion >> majorRevision [

	^ majorRevision
]

{ #category : #accessing }
PSVersion >> majorRevision: anObject [

	majorRevision := anObject
]

{ #category : #accessing }
PSVersion >> minor [

	^ minor
]

{ #category : #accessing }
PSVersion >> minor: anObject [

	minor := anObject
]

{ #category : #accessing }
PSVersion >> minorRevision [

	^ minorRevision
]

{ #category : #accessing }
PSVersion >> minorRevision: anObject [

	minorRevision := anObject
]

{ #category : #printing }
PSVersion >> printOn: aStream [

	^ aStream 
		nextPutAll: self major asString;
		nextPut: $.;
		nextPutAll: self minor asString;		
		nextPut: $.;
		nextPutAll: self build asString;
		nextPut: $.;						
		nextPutAll: self revision asString
]

{ #category : #accessing }
PSVersion >> revision [

	^ revision
]

{ #category : #accessing }
PSVersion >> revision: anObject [

	revision := anObject
]