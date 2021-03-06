Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'commandLine',
		'scriptArgs',
		'scriptPath',
		'usage',
		'noResult'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> basename [
	^ self scriptPath basename
]

{ #category : 'accessing' }
SuperDoitExecution >> commandLine [
	^ commandLine
		ifNil: [ 
			| stream |
			stream := WriteStream on: String new.
			stream
				nextPutAll: self basename;
				space.
			2 to: scriptArgs size do: [ :index | 
				stream
					nextPutAll: (scriptArgs at: index);
					space ].
			commandLine := stream contents ]
]

{ #category : 'accessing' }
SuperDoitExecution >> commandLine: aString [
	commandLine := aString
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

	^ noResult ifNil: [ noResult := Object new ]
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
SuperDoitExecution >> scriptPath [
	^ scriptPath
]

{ #category : 'accessing' }
SuperDoitExecution >> scriptPath: aFileReference [
	scriptPath := aFileReference
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
	string := usage copy.
	string copyReplaceAll: '$basename' with: self basename.
	^ string
]

{ #category : 'accessing' }
SuperDoitExecution >> usage: object [
	usage := object
]
