"
The PowerShell module type
"
Class {
	#name : #PSModuleType,
	#superclass : #SharedPool,
	#classVars : [
		'Binary',
		'Manifest',
		'Script'
	],
	#category : 'PowerShell-Core-Model'
}

{ #category : #'class initialization' }
PSModuleType class >> initialize [
	Script := 0.
	Binary := 1.
	Manifest := 2
]
