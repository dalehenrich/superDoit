Class {
	#name : 'SuperDoitCommand',
	#superclass : 'Object',
	#instVars : [
		'chunk'
	],
	#category : 'SuperDoit-Command'
}

{ #category : 'instance creation' }
SuperDoitCommand class >> chunk: aString [
	^ self new
		chunk: aString;
		yourself
]

{ #category : 'accessing' }
SuperDoitCommand >> chunk [
	^chunk
]

{ #category : 'accessing' }
SuperDoitCommand >> chunk: object [
	chunk := object
]

{ #category : 'execution' }
SuperDoitCommand >> executeAgainst: aCommandParser [
	self subclassResponsibility: #'executeAgainst:'
]

{ #category : 'execution' }
SuperDoitCommand >> preClassCreationExecuteAgainst: aCommandParser [
	"give all commands that need to be executed BEFORE class creation a chance to run"

	"noop by default"
]
