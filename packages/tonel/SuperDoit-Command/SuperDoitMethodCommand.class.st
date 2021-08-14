Class {
	#name : 'SuperDoitMethodCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitMethodCommand >> executeAgainst: aCommandParser [
	self compileMethod: self chunk for: aCommandParser superDoitExecutionClass
]
