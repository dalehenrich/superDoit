Class {
	#name : 'SuperDoitOptionalOptionWithOptionalArg',
	#superclass : 'SuperDoitOptionWithArgument',
	#category : 'SuperDoit-Option'
}

{ #category : 'instance creation' }
SuperDoitOptionalOptionWithOptionalArg class >> long: longName [
	self
		error:
			'options with optional arguments REQUIRE a default value, use long:default: instead'
]

{ #category : 'instance creation' }
SuperDoitOptionalOptionWithOptionalArg class >> long: longName short: shortName [
	self
		error:
			'options with optional arguments REQUIRE a default value, use long:short:default: instead'
]
