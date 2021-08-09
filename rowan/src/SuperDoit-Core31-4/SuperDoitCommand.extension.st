Extension { #name : 'SuperDoitCommand' }

{ #category : '*superdoit-core31-4' }
SuperDoitCommand >> compileMethod: methodSource for: aBehavior [
	aBehavior 
		compileMethod: methodSource 
		dictionaries: GsCurrentSession currentSession symbolList 
		category: 'superdoit' 
		environmentId: 0
]
