Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'commandLine',
		'scriptArgs',
		'scriptPath'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> dirname [
	^ self scriptPath parent
]

{ #category : 'accessing' }
SuperDoitExecution >> displayResult: anObject [
	self ston: anObject on: GsFile stdout
]

{ #category : 'accessing' }
SuperDoitExecution >> logMessage: aString [
	self stdout nextPutAll: aString; lf
]

{ #category : 'accessing' }
SuperDoitExecution >> log: anObject [
	| stdout |
	stdout := GsFile stdout.
	self ston: anObject on: stdout.
	stdout lf
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptPath [
	^ scriptPath ifNil: [ '' ]
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptPath: aString [
	scriptPath := aString
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
SuperDoitExecution >> commandLine [
	^ commandLine 
			ifNil: [ 
				| stream |
				stream := WriteStream on: String new.
				stream nextPutAll: self scriptPath basename; space.
				2 to: scriptArgs size do: [:index |
					stream nextPutAll: (scriptArgs at: index); space ].
				commandLine := stream contents ]
]

{ #category : 'accessing' }
SuperDoitExecution >> commandLine: aString [
	commandLine := aString
]

{ #category : 'accessing' }
SuperDoitExecution >> stdout [
	^ GsFile stdout 
]

{ #category : 'accessing' }
SuperDoitExecution >> ston: anObject on: aStream [
	STON put: anObject onStreamPretty: aStream
]
