Class {
	#name : 'SuperDoitInstVarNamesCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitInstVarNamesCommand >> executeAgainst: aCommandParser [
	aCommandParser
		instVarNames: aCommandParser instVarNames , ('#(' , self chunk , ')') evaluate
]
