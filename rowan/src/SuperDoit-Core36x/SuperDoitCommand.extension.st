Extension { #name : 'SuperDoitCommand' }

{ #category : '*superdoit-core36x' }
SuperDoitCommand >> symbolListExpressionString [
	^ 'GsCurrentSession currentSession transientSymbolList'
]
