Class {
	#name : 'SuperDoitUsageCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Core'
}

{ #category : 'execution' }
SuperDoitUsageCommand >> executeAgainst: aCommandParser [
	aCommandParser usage: self chunk
]
