Class {
	#name : 'SuperDoitProjectsHomeCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitProjectsHomeCommand >> executeAgainst: aCommandParser [
	| projectsHomeStream |
	projectsHomeStream := self chunk readStreamPortable.
	[ projectsHomeStream atEnd ]
		whileFalse: [ 
			"last declaration wins"
			aCommandParser projectsHome: projectsHomeStream nextLine ]
]
