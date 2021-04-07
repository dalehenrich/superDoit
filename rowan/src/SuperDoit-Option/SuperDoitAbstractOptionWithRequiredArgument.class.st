Class {
	#name : 'SuperDoitAbstractOptionWithRequiredArgument',
	#superclass : 'SuperDoitAbstractOption',
	#instVars : [
		'defaultValue'
	],
	#category : 'SuperDoit-Option'
}

{ #category : 'instance creation' }
SuperDoitAbstractOptionWithRequiredArgument class >> long: longName default: default [
	^ self new
		initialize;
		longName: longName;
		defaultValue: default;
		yourself
]

{ #category : 'instance creation' }
SuperDoitAbstractOptionWithRequiredArgument class >> long: longName short: shortName default: default [
	^ self new
		initialize;
		longName: longName;
		shortName: shortName;
		defaultValue: default;
		yourself
]

{ #category : 'testing' }
SuperDoitAbstractOptionWithRequiredArgument >> argExpected [
	^ true
]

{ #category : 'accessing' }
SuperDoitAbstractOptionWithRequiredArgument >> defaultValue [
	^defaultValue
]

{ #category : 'accessing' }
SuperDoitAbstractOptionWithRequiredArgument >> defaultValue: object [
	defaultValue := object
]

{ #category : 'accessing' }
SuperDoitAbstractOptionWithRequiredArgument >> markNoValue [
	"mark with a noValue object that is unique when the optional options have been referenced on command line, should trigger use of defaultValue"

	(value ~~ self notSet and: [ value ~~ self noValue])
		ifTrue: [ 
			self
				error:
					'The option ' , self longName printString , ' has already been processed.' ].
	value := self noValue
]

{ #category : 'accessing' }
SuperDoitAbstractOptionWithRequiredArgument >> value [
	^ (value == self noValue or: [ value == self notSet ])
		ifTrue: [ self defaultValue ]
		ifFalse: [ value ]
]
