"
## Purpose

A command chainer is chaining a few shell commands into a common combined command.
"
Class {
	#name : #PSCommandChainer,
	#superclass : #Object,
	#instVars : [
		'commands'
	],
	#category : #'PowerShell-Core-Utilities'
}

{ #category : #operating }
PSCommandChainer >> addCommand: aSingleCommand [
	"Add a given command string to the collection of commands to combine"
	
	commands add: aSingleCommand 
]

{ #category : #accessing }
PSCommandChainer >> combinedCommand [
	"Combine the commands and separate them via '; ' "
	
	^String streamContents: [:s |
		commands do: [:each | s nextPutAll: each ] separatedBy: [ s nextPutAll: '; ' ]
	]
]

{ #category : #initialization }
PSCommandChainer >> initialize [ 
	super initialize.
	commands := OrderedCollection new
]
