Class {
	#name : 'SuperDoitAbstractOption',
	#superclass : 'Object',
	#instVars : [
		'longName',
		'shortName',
		'value'
	],
	#classVars : [
		'NotSet',
		'NoValue'
	],
	#category : 'SuperDoit-Option'
}

{ #category : 'instance creation' }
SuperDoitAbstractOption class >> long: longName [
	^ self new
		initialize;
		longName: longName;
		yourself
]

{ #category : 'instance creation' }
SuperDoitAbstractOption class >> long: longName short: shortName [
	^ self new
		initialize;
		longName: longName;
		shortName: shortName;
		yourself
]

{ #category : 'accessing' }
SuperDoitAbstractOption class >> notSet [
	^ NotSet ifNil: [ NotSet := Object new ]
]

{ #category : 'accessing' }
SuperDoitAbstractOption class >> noValue [
	^ NoValue ifNil: [ NoValue := Object new ]
]

{ #category : 'testing' }
SuperDoitAbstractOption >> argExpected [
	^ false
]

{ #category : 'testing' }
SuperDoitAbstractOption >> argRequired [
	^ false
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> defaultValue [
	^ false
]

{ #category : 'initialization' }
SuperDoitAbstractOption >> initialize [
	value := self notSet
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> longName [
	^longName
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> longName: object [
	longName := object
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> notSet [
	^ self class notSet
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> noValue [
	^ self class noValue
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> shortName [
	^shortName
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> shortName: object [
	shortName := object
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> value [
	^ value == self notSet
		ifTrue: [ self defaultValue ]
		ifFalse: [ value ]
]

{ #category : 'accessing' }
SuperDoitAbstractOption >> value: object [
	value ~~ self notSet
		ifTrue: [ 
			self
				error:
					'The option ' , self longName printString , ' has already been processed.' ].
	value := object
]

{ #category : 'testing' }
SuperDoitAbstractOption >> wasSet [
	"answer true if the receiver was set on the command line"

	^ value ~~ self notSet
]
