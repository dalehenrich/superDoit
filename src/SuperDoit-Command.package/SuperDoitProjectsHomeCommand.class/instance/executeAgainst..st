execution
executeAgainst: aCommandParser
	| projectsHomeStream |
	SuperDoitExecution
		globalNamed: #'Rowan'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specs command' ].
	projectsHomeStream := self chunk readStreamPortable.
	[ projectsHomeStream atEnd ]
		whileFalse: [ 
			"last declaration wins"
			aCommandParser projectsHome: projectsHomeStream nextLine ]