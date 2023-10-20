"
A package to deal with Microsoft PowerShell
"
Class {
	#name : #ManifestPowerShellCore,
	#superclass : #PackageManifest,
	#category : 'PowerShell-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestPowerShellCore class >> ruleExcessiveVariablesRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#PSRemoteModule)) #'2023-10-20T20:50:13.796213+02:00') )
]
