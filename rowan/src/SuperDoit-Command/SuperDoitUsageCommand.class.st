Class {
	#name : 'SuperDoitUsageCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitUsageCommand >> executeAgainst: aCommandParser [
	aCommandParser usage: self chunk
]
