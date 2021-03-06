Class {
	#name : 'SuperDoitCommandDefinition',
	#superclass : 'Object',
	#instVars : [
		'commands'
	],
	#category : 'SuperDoit-Command'
}

{ #category : 'creation' }
SuperDoitCommandDefinition >> addCommand: aSuperDoitCommand [
	self commands add: aSuperDoitCommand
]

{ #category : 'accessing' }
SuperDoitCommandDefinition >> commands [
	^ commands ifNil: [ commands := OrderedCollection new ]
]

{ #category : 'execution' }
SuperDoitCommandDefinition >> executeAgainst: aCommandParser [
	self commands do: [ :command | command executeAgainst: aCommandParser ]
]

{ #category : 'execution' }
SuperDoitCommandDefinition >> preClassCreationExecuteAgainst: aCommandParser [
	"give all commands that need to be executed BEFORE class creation a chance to run"

	self commands
		do: [ :command | command preClassCreationExecuteAgainst: aCommandParser ]
]
