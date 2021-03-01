Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> displayResult: anObject [
	^ GsFile stdout nextPutAll: anObject printString
]
