Class {
	#name : 'SuperDoitInstVarNamesCommand',
	#superclass : 'SuperDoitCommand',
	#instVars : [
		'executed'
	],
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitInstVarNamesCommand >> executeAgainst: aCommandParser [
	self executed ifTrue: [ ^ self ].
	aCommandParser
		instVarNames: aCommandParser instVarNames , ('#(' , self chunk , ')') evaluate.
	self executed: true
]

{ #category : 'accessing' }
SuperDoitInstVarNamesCommand >> executed [
	^ executed ifNil: [ executed := false ]
]

{ #category : 'accessing' }
SuperDoitInstVarNamesCommand >> executed: object [
	executed := object
]

{ #category : 'execution' }
SuperDoitInstVarNamesCommand >> preClassCreationExecuteAgainst: aCommandParser [
	"give all commands that need to be executed BEFORE class creation a chance to run"

	self executeAgainst: aCommandParser
]
