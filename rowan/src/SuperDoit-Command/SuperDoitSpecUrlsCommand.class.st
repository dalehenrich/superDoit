Class {
	#name : 'SuperDoitSpecUrlsCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitSpecUrlsCommand >> executeAgainst: aCommandParser [
	| urlStream |
	urlStream := self chunk readStreamPortable.
	[ urlStream atEnd ]
		whileFalse: [ 
			| url spec |
			url := urlStream nextLine.
			spec := (RwSpecification fromUrl: url)
				projectsHome: aCommandParser projectsHome;
				yourself.
			aCommandParser specs add: spec ]
]
