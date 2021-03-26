Class {
	#name : 'SuperDoitCommand',
	#superclass : 'Object',
	#instVars : [
		'chunk'
	],
	#category : 'SuperDoit-Core'
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
