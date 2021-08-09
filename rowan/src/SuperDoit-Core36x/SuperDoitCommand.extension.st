Extension { #name : 'SuperDoitCommand' }

{ #category : '*superdoit-core36x' }
SuperDoitCommand >> compileMethod: methodSource for: aBehavior [
	aBehavior compileMethod: methodSource
]

{ #category : '*superdoit-core36x' }
SuperDoitCommand >> symbolListExpressionString [
	^ 'GsCurrentSession currentSession transientSymbolList'
]
