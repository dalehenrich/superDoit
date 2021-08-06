Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-solo-core' }
SuperDoitExecution >> basename [
	^ self scriptPath basename
]

{ #category : '*superdoit-solo-core' }
SuperDoitExecution >> dirname [
	^ self scriptPath parent
]

{ #category : '*superdoit-solo-core' }
SuperDoitExecution >> scriptPath: aFileReference [
	_scriptPath := aFileReference
]
