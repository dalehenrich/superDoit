execution
executeAgainst: aCommandParser
	(SuperDoitExecution globalNamed: self className)
		ifNotNil: [ :class | 
			| beh |
			beh := self isMeta
				ifTrue: [ class class ]
				ifFalse: [ class ].
			self compileMethod: self chunk for: beh ]
		ifNil: [ self error: 'No class ' , className printString , ' found' ]