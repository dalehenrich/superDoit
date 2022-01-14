execution
executeAgainst: aCommandParser
	| stonStream |
	SuperDoitExecution
		globalNamed: #'Rowan'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specs command' ].
	stonStream := self chunk readStreamPortable.
	[ stonStream atEnd ]
		whileFalse: [ 
			| obj |
			obj := (SuperDoitExecution globalNamed: #'STON') fromStream: stonStream.
			obj _isArray
				ifTrue: [ aCommandParser specs addAll: obj ]
				ifFalse: [ aCommandParser specs add: obj ] ]