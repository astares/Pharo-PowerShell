Class {
	#name : 'PSCommandChainerTest',
	#superclass : 'TestCase',
	#category : 'PowerShell-Core-Tests-Utilities',
	#package : 'PowerShell-Core-Tests',
	#tag : 'Utilities'
}

{ #category : 'tests' }
PSCommandChainerTest >> testChainingCommands [
   |chainer|
	chainer := PSCommandChainer new.
	chainer
		addCommand: 'foo';
		addCommand: 'bar'.

	self assert: chainer combinedCommand equals: 'foo; bar'
]
