"
A PowerShell repository
"
Class {
	#name : 'PSRepository',
	#superclass : 'PSNamedObject',
	#instVars : [
		'sourceLocation',
		'trusted',
		'registered',
		'installationPolicy',
		'packageManagementProvider',
		'publishLocation',
		'scriptSourceLocation',
		'scriptPublishLocation'
	],
	#category : 'PowerShell-Core-Model',
	#package : 'PowerShell-Core',
	#tag : 'Model'
}

{ #category : 'examples' }
PSRepository class >> gallery [
	<sampleInstance>
		
	^ self named: 'PSGallery'
]

{ #category : 'private - initialization' }
PSRepository >> initFromDictionary: aDictionary [
	"Initializes the receiver from the given dictionary"

	self
		name: (aDictionary at: #Name ifAbsent: '');
		sourceLocation: (aDictionary at: #SourceLocation ifAbsent: '');
		trusted: (aDictionary at: #Trusted ifAbsent: true);
		registered: (aDictionary at: #Registered ifAbsent: true);
		installationPolicy: (aDictionary at: #InstallationPolicy ifAbsent: 'Untrusted');
		packageManagementProvider: (aDictionary at: #PackageManagementProvider ifAbsent: 'NuGet');
		publishLocation: (aDictionary at: #PublishLocation ifAbsent: '');
		scriptSourceLocation: (aDictionary at: #ScriptSourceLocation ifAbsent: '');
		scriptPublishLocation: (aDictionary at: #ScriptPublishLocation ifAbsent: '')
]

{ #category : 'accessing' }
PSRepository >> installationPolicy [

	^ installationPolicy
]

{ #category : 'accessing' }
PSRepository >> installationPolicy: anObject [

	installationPolicy := anObject
]

{ #category : 'accessing' }
PSRepository >> packageManagementProvider [

	^ packageManagementProvider
]

{ #category : 'accessing' }
PSRepository >> packageManagementProvider: anObject [

	packageManagementProvider := anObject
]

{ #category : 'accessing' }
PSRepository >> publishLocation [

	^ publishLocation
]

{ #category : 'accessing' }
PSRepository >> publishLocation: anObject [

	publishLocation := anObject
]

{ #category : 'accessing' }
PSRepository >> registered [

	^ registered
]

{ #category : 'accessing' }
PSRepository >> registered: anObject [

	registered := anObject
]

{ #category : 'accessing' }
PSRepository >> scriptPublishLocation [

	^ scriptPublishLocation
]

{ #category : 'accessing' }
PSRepository >> scriptPublishLocation: anObject [

	scriptPublishLocation := anObject
]

{ #category : 'accessing' }
PSRepository >> scriptSourceLocation [

	^ scriptSourceLocation
]

{ #category : 'accessing' }
PSRepository >> scriptSourceLocation: anObject [

	scriptSourceLocation := anObject
]

{ #category : 'accessing' }
PSRepository >> sourceLocation [

	^ sourceLocation
]

{ #category : 'accessing' }
PSRepository >> sourceLocation: anObject [

	sourceLocation := anObject
]

{ #category : 'accessing' }
PSRepository >> trusted [

	^ trusted
]

{ #category : 'accessing' }
PSRepository >> trusted: anObject [

	trusted := anObject
]
