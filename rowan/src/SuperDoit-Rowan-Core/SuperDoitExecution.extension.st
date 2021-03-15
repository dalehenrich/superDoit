Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-rowan-core' }
SuperDoitExecution >> globalNamed: aString ifAbsent: absentBlock [
	^ (Rowan globalNamed: aString) ifNil: absentBlock
]
