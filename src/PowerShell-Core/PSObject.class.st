"
Abstract superclass for PowerShell objects
"
Class {
	#name : #PSObject,
	#superclass : #Object,
	#category : 'PowerShell-Core-Model'
}

{ #category : #'instance creation' }
PSObject class >> fromDictionary: aDictionary [

	^ self new
		  initFromDictionary: aDictionary;
		  yourself
]

{ #category : #'instance creation' }
PSObject class >> fromJSON: aString [

	^ self fromDictionary: (STON fromString: aString)
]

{ #category : #testing }
PSObject class >> isAbstract [

	^ self == PSObject
]

{ #category : #'private - initialization' }
PSObject >> initFromDictionary: aDictionary [
	"Initializes the receiver from the given dictionary"

	self subclassResponsibility
]
