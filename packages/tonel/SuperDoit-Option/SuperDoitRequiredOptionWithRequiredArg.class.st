Class {
	#name : 'SuperDoitRequiredOptionWithRequiredArg',
	#superclass : 'SuperDoitOptionalOptionWithRequiredArg',
	#category : 'SuperDoit-Option'
}

{ #category : 'instance creation' }
SuperDoitRequiredOptionWithRequiredArg class >> long: longName default: default [
	self
		error:
			'required options with required arguments have no default value, use long: instead'
]

{ #category : 'instance creation' }
SuperDoitRequiredOptionWithRequiredArg class >> long: longName short: shortName default: default [
	self
		error:
			'required options with required arguments have no default value, use long:short: instead'
]

{ #category : 'testing' }
SuperDoitRequiredOptionWithRequiredArg >> isRequired [
	^ true
]
