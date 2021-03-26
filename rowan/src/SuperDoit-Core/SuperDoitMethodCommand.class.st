Class {
	#name : 'SuperDoitMethodCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Core'
}

{ #category : 'execution' }
SuperDoitMethodCommand >> executeAgainst: aCommandParser [
	aCommandParser superDoitExecutionClass compileMethod: self chunk
]
