"
A PSRepositoryTest is a test class for testing the behavior of PSRepository
"
Class {
	#name : #PSRepositoryTest,
	#superclass : #TestCase,
	#instVars : [
		'repository'
	],
	#category : 'PowerShell-Core-Tests-Model'
}

{ #category : #data }
PSRepositoryTest >> sampleJSONString [

	^ '{
  "Name": "PSGallery",
  "SourceLocation": "https://www.powershellgallery.com/api/v2",
  "Trusted": false,
  "Registered": true,
  "InstallationPolicy": "Untrusted",
  "PackageManagementProvider": "NuGet",
  "PublishLocation": "https://www.powershellgallery.com/api/v2/package/",
  "ScriptSourceLocation": "https://www.powershellgallery.com/api/v2/items/psscript",
  "ScriptPublishLocation": "https://www.powershellgallery.com/api/v2/package/",
  "ProviderOptions": {}
}'
]

{ #category : #running }
PSRepositoryTest >> setUp [

	super setUp.
	repository := PSRepository fromJSON: self sampleJSONString
]

{ #category : #tests }
PSRepositoryTest >> testFromJSONString [

	self
		assert: repository name equals: 'PSGallery';
		assert: repository sourceLocation equals: 'https://www.powershellgallery.com/api/v2';
		assert: repository trusted equals: false;
		assert: repository registered equals: true;
		assert: repository installationPolicy equals: 'Untrusted';
		assert: repository packageManagementProvider equals: 'NuGet';
		assert: repository publishLocation equals: 'https://www.powershellgallery.com/api/v2/package/';
		assert: repository scriptSourceLocation equals: 'https://www.powershellgallery.com/api/v2/items/psscript';
		assert: repository scriptPublishLocation equals: 'https://www.powershellgallery.com/api/v2/package/'
]

{ #category : #tests }
PSRepositoryTest >> testPowerShellName [

	self assert: PSRepository powerShellName equals: 'PSRepository'
]

{ #category : #tests }
PSRepositoryTest >> testPrintString [

	self assert: repository printString equals: 'PSGallery'
]
