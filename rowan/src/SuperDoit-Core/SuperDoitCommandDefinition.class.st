Class {
	#name : 'SuperDoitCommandDefinition',
	#superclass : 'Object',
	#instVars : [
		'commands'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'creation' }
SuperDoitCommandDefinition >> addCommand: aSuperDoitCommand [
	self commands add: aSuperDoitCommand
]

{ #category : 'accessing' }
SuperDoitCommandDefinition >> commands [
	^ commands ifNil: [ commands := {} ]
]

{ #category : 'execution' }
SuperDoitCommandDefinition >> executeAgainst: aCommandParser [
	self commands do: [ :command | command executeAgainst: aCommandParser ]
]
