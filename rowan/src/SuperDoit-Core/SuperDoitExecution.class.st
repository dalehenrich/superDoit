Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'scriptArgs'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> displayResult: anObject [
	self ston: anObject on: GsFile stdout
]

{ #category : 'accessing' }
SuperDoitExecution >> log: anObject [
	| stdout |
	stdout := GsFile stdout.
	self ston: anObject on: stdout.
	stdout lf
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs [
	^ scriptArgs ifNil: [ #() ]
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs: aColl [
	scriptArgs := aColl
]

{ #category : 'accessing' }
SuperDoitExecution >> stdout [
	^ GsFile stdout 
]

{ #category : 'accessing' }
SuperDoitExecution >> ston: anObject on: aStream [
	STON put: anObject onStreamPretty: aStream
]
