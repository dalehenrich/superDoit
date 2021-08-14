Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-tode-core' }
SuperDoitExecution >> globalNamed: aString ifAbsent: absentBlock [
	^Smalltalk at: aString asSymbol ifAbsent: absentBlock
]
