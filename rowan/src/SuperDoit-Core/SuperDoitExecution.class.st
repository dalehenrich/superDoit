Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'scriptArgs'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> stdout [
	^ GsFile stdout 
]

{ #category : 'accessing' }
SuperDoitExecution >> displayResult: anObject [
	^ GsFile stdout nextPutAll: anObject printString
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs: aColl [
	scriptArgs := aColl
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs [
	^ scriptArgs ifNil: [ #() ]
]

