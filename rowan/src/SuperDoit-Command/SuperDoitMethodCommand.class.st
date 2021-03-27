Class {
	#name : 'SuperDoitMethodCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitMethodCommand >> executeAgainst: aCommandParser [
	aCommandParser superDoitExecutionClass compileMethod: self chunk
]
