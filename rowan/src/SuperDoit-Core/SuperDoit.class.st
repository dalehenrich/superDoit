Class {
	#name : 'SuperDoit',
	#superclass : 'Object',
	#instVars : [
		'stream',
		'done'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'instance creation' }
SuperDoit class >> processInputFile [
	| args scriptArgStart argIndex scriptFile |
	args := System commandLineArguments.
	scriptArgStart := args indexOf: '--'.
	argIndex := scriptArgStart + 1.	"arg after initial --"
	(scriptArgStart <= 0 or: [ argIndex > args size ])
		ifTrue: [ self error: 'input file is expected to be specified on the command line' ].
	scriptFile := args at: argIndex.
	^ self new parseAndExecuteScriptFile: scriptFile asFileReference
]

{ #category : 'parsing' }
SuperDoit >> document [
	| ar |
	ar := {}.
	[ self done ] whileFalse: [ ar addLast: self parseChunk ].
	^ ar select: [ :each | each notNil ]
]

{ #category : 'accessing' }
SuperDoit >> done [
^ done ifNil: [ false ]
]

{ #category : 'parsing' }
SuperDoit >> isSeparator: aCharacter [ 
	^ aCharacter isSeparator
]

{ #category : 'execution' }
SuperDoit >> parseAndExecuteScriptFile: scriptFileReference [
	scriptFileReference
		readStreamDo: [ :fStream | 
			stream := fStream.
			^ self createClassFrom: self document ]
]

{ #category : 'parsing' }
SuperDoit >> parseChunk [
	((stream peekFor: $#) or: [ stream peekFor: $! ])
		ifTrue: [ 
			"ignore lines beginning with $# or #!"
			stream upTo: Character lf.
			^ nil ].
	self separator.
	self try: [ self word: 'specurls' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'specs' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'instvars' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'method' ] onSuccess: [ :word | ^ word  ].
	self try: [ self word: 'doit' ] onSuccess: [ :word | ^ word  ].
]

{ #category : 'parsing' }
SuperDoit >> separator [
	[ stream atEnd not and: [ self isSeparator: stream peek ] ]
		whileTrue: [ stream next ].
	^ nil
]

{ #category : 'parsing' }
SuperDoit >> try: aBlock onSuccess: successBlock [
	^ self 
		try: aBlock 
		onSuccess: successBlock 
		onFailure: [ nil ]
]

{ #category : 'parsing' }
SuperDoit >> try: aBlock onSuccess: successBlock onFailure: failureBlock [
	| pos |
	
	pos := stream position.
	[ ^ successBlock value: aBlock value ]
	on: Error
	do: [ :e | 
		stream position: pos.
		^ failureBlock value ].
]

{ #category : 'parsing' }
SuperDoit >> word: aString [
	| result |
	result := stream next: aString size.
	result = aString
		ifFalse: [ self error: 'Can''t parse ', aString ].
	^ result
]
