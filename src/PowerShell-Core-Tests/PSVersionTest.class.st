"
A PSVersionTest is a test class for testing the behavior of PSVersion
"
Class {
	#name : #PSVersionTest,
	#superclass : #TestCase,
	#instVars : [
		'version'
	],
	#category : 'PowerShell-Core-Tests-Model'
}

{ #category : #data }
PSVersionTest >> sampleJSONString [

	^'{
    "Major":  5,
    "Minor":  1,
    "Build":  22621,
    "Revision":  2428,
    "MajorRevision":  0,
    "MinorRevision":  2428
	}'
]

{ #category : #running }
PSVersionTest >> setUp [

	super setUp.
	version := PSVersion fromJSON: self sampleJSONString
]

{ #category : #tests }
PSVersionTest >> testFromJSONString [

	self
		assert: version major equals: 5;
		assert: version minor equals: 1;
		assert: version build equals: 22621;
		assert: version revision equals: 2428;
		assert: version majorRevision equals: 0;
		assert: version minorRevision equals: 2428
]

{ #category : #tests }
PSVersionTest >> testInitialization [

	|instance|
	instance := PSVersion new.
	self
		assert: instance major equals: 0;
		assert: instance minor equals: 0;
		assert: instance build equals: 0;
		assert: instance revision equals: 0;
		assert: instance majorRevision equals: 0;
		assert: instance minorRevision equals: 0
]

{ #category : #tests }
PSVersionTest >> testPrintString [

	self assert: version printString equals: '5.1.22621.2428'
]
