Class {
	#name : 'SuperDoitExtensionMethodCommand',
	#superclass : 'SuperDoitCommand',
	#instVars : [
		'className',
		'isMeta'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'instance creation' }
SuperDoitExtensionMethodCommand class >> chunk: aString className: className [
	^ self new
		chunk: aString;
		className: className;
		yourself
]

{ #category : 'instance creation' }
SuperDoitExtensionMethodCommand class >> chunk: aString className: className isMeta: aBool [
	^ self new
		chunk: aString;
		className: className;
		isMeta: aBool;
		yourself
]

{ #category : 'accessing' }
SuperDoitExtensionMethodCommand >> className [
	^className
]

{ #category : 'accessing' }
SuperDoitExtensionMethodCommand >> className: object [
	className := object
]

{ #category : 'execution' }
SuperDoitExtensionMethodCommand >> executeAgainst: aCommandParser [
	(Rowan globalNamed: self className)
		ifNotNil: [ :class | 
			| beh |
			beh := self isMeta
				ifTrue: [ class class ]
				ifFalse: [ class ].
			beh compileMethod: self chunk ]
		ifNil: [ self error: 'No class ' , className printString , ' found' ]
]

{ #category : 'accessing' }
SuperDoitExtensionMethodCommand >> isMeta [
	^ isMeta ifNil: [ false ]
]

{ #category : 'accessing' }
SuperDoitExtensionMethodCommand >> isMeta: object [
	isMeta := object
]
