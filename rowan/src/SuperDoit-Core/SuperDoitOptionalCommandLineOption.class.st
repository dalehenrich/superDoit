Class {
	#name : 'SuperDoitOptionalCommandLineOption',
	#superclass : 'SuperDoitCommandLineOptionWithArgument',
	#instVars : [
		'defaultValue'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitOptionalCommandLineOption >> defaultValue [
	^defaultValue
]

{ #category : 'accessing' }
SuperDoitOptionalCommandLineOption >> defaultValue: object [
	defaultValue := object
]
