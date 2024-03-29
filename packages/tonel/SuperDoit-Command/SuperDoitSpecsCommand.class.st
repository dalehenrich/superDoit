Class {
	#name : 'SuperDoitSpecsCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitSpecsCommand >> executeAgainst: aCommandParser [
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
			obj := (SuperDoitExecution globalNamed: #STON) fromStream: stonStream.
			obj _isArray
				ifTrue: [ 
					aCommandParser specs
						addAll:
							(obj
								collect: [ :each | 
									each
										projectsHome: aCommandParser projectsHome;
										yourself ]) ]
				ifFalse: [ 
					obj projectsHome: aCommandParser projectsHome.
					aCommandParser specs add: obj ] ]
]
