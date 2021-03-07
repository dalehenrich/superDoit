Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'_commandLine',
		'_scriptArgs',
		'_scriptPath',
		'_usage',
		'_noResult'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> basename [
	^ self scriptPath basename
]

{ #category : 'accessing' }
SuperDoitExecution >> commandLine [
	^ _commandLine
		ifNil: [ 
			| stream |
			stream := WriteStream on: String new.
			stream
				nextPutAll: self basename;
				space.
			2 to: _scriptArgs size do: [ :index | 
				stream
					nextPutAll: (_scriptArgs at: index);
					space ].
			_commandLine := stream contents ]
]

{ #category : 'accessing' }
SuperDoitExecution >> commandLine: aString [
	_commandLine := aString
]

{ #category : 'accessing' }
SuperDoitExecution >> dirname [
	^ self scriptPath parent
]

{ #category : 'accessing' }
SuperDoitExecution >> displayResult: anObject [
	anObject ~~ self noResult
		ifTrue: [ self ston: anObject on: self stdout ]
]

{ #category : 'accessing' }
SuperDoitExecution >> log: anObject [
	| stdout |
	stdout := GsFile stdout.
	self ston: anObject on: stdout.
	stdout lf
]

{ #category : 'accessing' }
SuperDoitExecution >> logMessage: aString [
	self stdout nextPutAll: aString; lf
]

{ #category : 'accessing' }
SuperDoitExecution >> noResult [
	"unique object to use a return value when no result should be written to stdout"

	^ _noResult ifNil: [ _noResult := Object new ]
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs [
	^ _scriptArgs ifNil: [ #() ]
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptArgs: aColl [
	_scriptArgs := aColl
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptPath [
	^ _scriptPath
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptPath: aFileReference [
	_scriptPath := aFileReference
]

{ #category : 'accessing' }
SuperDoitExecution >> stdout [
	^ GsFile stdout 
]

{ #category : 'accessing' }
SuperDoitExecution >> ston: anObject on: aStream [
	STON put: anObject onStreamPretty: aStream
]

{ #category : 'accessing' }
SuperDoitExecution >> usage [
	| string |
	string := _usage copy.
	string copyReplaceAll: '$basename' with: self basename.
	^ string
]

{ #category : 'accessing' }
SuperDoitExecution >> usage: object [
	_usage := object
]
