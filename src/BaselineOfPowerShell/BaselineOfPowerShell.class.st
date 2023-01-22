"
A simple Pharo wrapper for the Gravatar API
See [https://github.com/astares/Pharo-Gravatar](https://github.com/astares/Pharo-Gravatar)
"
Class {
	#name : #BaselineOfPowerShell,
	#superclass : #BaselineOf,
	#category : #BaselineOfPowerShell
}

{ #category : #baselines }
BaselineOfPowerShell >> baseline: spec [
	<baseline>
	spec
		for: #common do: [
			"Packages"
			spec
				package: 'PowerShell-Core';
				package: 'PowerShell-Core-Tests' with: [ spec requires: #('PowerShell-Core') ].

			"Groups"
			spec
				group: 'Core' with: #('PowerShell-Core');
				group: 'Tests' with: #('PowerShell-Core-Tests');
				group: 'CI' with: #('Tests');
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('Core' 'Tests') ]
]
