Class {
	#name : 'SuperDoitCommandLineOptionWithArgument',
	#superclass : 'SuperDoitCommandLineOption',
	#category : 'SuperDoit-Core'
}

{ #category : 'instance creation' }
SuperDoitCommandLineOptionWithArgument class >> long: longName [
	self
		error:
			'optional command line options REQUIRE a default value, use long:default: instead'
]

{ #category : 'instance creation' }
SuperDoitCommandLineOptionWithArgument class >> long: longName default: default [
	^ self new
		initialize;
		longName: longName;
		defaultValue: default;
		yourself
]

{ #category : 'instance creation' }
SuperDoitCommandLineOptionWithArgument class >> long: longName short: shortName [
	self
		error:
			'optional command line options REQUIRE a default value, use long:short:default: instead'
]

{ #category : 'instance creation' }
SuperDoitCommandLineOptionWithArgument class >> long: longName short: shortName default: default [
	^ self new
		initialize;
		longName: longName;
		shortName: shortName;
		defaultValue: default;
		yourself
]

{ #category : 'testing' }
SuperDoitCommandLineOptionWithArgument >> argExpected [
	^ true
]

{ #category : 'accessing' }
SuperDoitCommandLineOptionWithArgument >> markNoValue [
	"Since nil is a valid value, mark with a noValue object that is unique when the optional options have been referenced on command line, should trigger use of defaultValue"

	value
		ifNotNil: [ 
			self
				error:
					'The option ' , self longName printString , ' has already been processed.' ].
	value := self noValue
]

{ #category : 'accessing' }
SuperDoitCommandLineOptionWithArgument >> value [
	^ (value == self noValue or: [ value == self notSet ])
		ifTrue: [ self defaultValue ]
		ifFalse: [ value ]
]

{ #category : 'testing' }
SuperDoitCommandLineOptionWithArgument >> wasSet [
	"answer true if the receiver was set on the command line"

	^ value notNil
]
