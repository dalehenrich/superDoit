Class {
	#name : 'SuperDoitExecution',
	#superclass : 'Object',
	#instVars : [
		'_commandLine',
		'_scriptArgs',
		'_scriptPath',
		'_usage',
		'_noResult',
		'_positionalArgs',
		'_loadSpecs',
		'_optionsDict'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'accessing' }
SuperDoitExecution >> _loadSpecs [
	^ _loadSpecs
]

{ #category : 'accessing' }
SuperDoitExecution >> _loadSpecs: specs [
	_loadSpecs := specs
]

{ #category : 'private' }
SuperDoitExecution >> _specsDict [
	| specsDict |
	specsDict := Dictionary new
		at: 'long' put: Dictionary new;
		at: 'short' put: Dictionary new;
		yourself.
	self optionsDict
		do: [ :option | 
			(specsDict at: 'long') at: option longName put: option.
			option shortName
				ifNotNil: [ :shortName | (specsDict at: 'short') at: shortName put: option ] ].
	^ specsDict
]

{ #category : 'script info' }
SuperDoitExecution >> basename [
	^ self scriptPath basename
]

{ #category : 'command line' }
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

{ #category : 'command line' }
SuperDoitExecution >> commandLine: aString [
	_commandLine := aString
]

{ #category : 'command line' }
SuperDoitExecution >> commandLineSummary [
	| opts |
	opts := Dictionary new.
	self optionsDict do: [:option |
		option wasSet
			ifTrue: [ opts at: option longName put: option value ] ].
	^ Dictionary new
		at: 'options' put: opts;
		at: 'args' put: self positionalArgs; 
		yourself.
]

{ #category : 'script info' }
SuperDoitExecution >> dirname [
	^ self scriptPath parent
]

{ #category : 'logging' }
SuperDoitExecution >> displayResult: anObject [
	anObject ~~ self noResult
		ifTrue: [ self ston: anObject on: self stdout ]
]

{ #category : 'script execution' }
SuperDoitExecution >> doit [
	"standard option handling ... for customization override in script"

	[ 
	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit ]
		on: Error
		do: [ :ex | 
			((self respondsTo: #'debug') and: [ self debug ])
				ifTrue: [ ex pass ].
			self exit: ex messageText withStatus: 1	"does not return" ]
]

{ #category : 'script info' }
SuperDoitExecution >> executionStoneName [
	^GsNetworkResourceString currentStoneName
]

{ #category : 'exit' }
SuperDoitExecution >> exit: message withStatus: statusInteger [
	"Does not return and terminates the os process with exit status <statusInteger>"

	self logErrorMessage: message.
	ExitClientError signal: 'explicit process exit' status: statusInteger
]

{ #category : 'exit' }
SuperDoitExecution >> exitWithStatus: statusInteger [
	"Does not return and terminates the os process with exit status <statusInteger>"

	ExitClientError signal: 'explicit process exit' status: statusInteger
]

{ #category : 'script execution' }
SuperDoitExecution >> getAndVerifyOptions [
	"standard option handling ... for customization override in script"

	self getOpts.
	((self respondsTo: #'help') and: [ self help ])
		ifTrue: [ ^ self usage ].
	self optionsDict
		keysAndValuesDo: [ :longName :option | 
			option isRequired
				ifTrue: [ 
					option wasSet
						ifFalse: [ self error: 'The required option ' , longName printString , ' was not set.' ] ] ]
]

{ #category : 'command line' }
SuperDoitExecution >> getOpts [
	| argStream opt theArgs specsDict |
	specsDict := self _specsDict.
	_positionalArgs := {}.
	theArgs := self scriptArgs asArray.
	theArgs size = 0
		ifTrue: [ ^ self ].
	argStream := ReadStream on: (theArgs copyFrom: 1 to: theArgs size).
	[ argStream atEnd ]
		whileFalse: [ 
			| optOrArg |
			optOrArg := argStream next.
			(optOrArg = '--' or: [ optOrArg = '-' ])
				ifTrue: [ self error: 'Cannot handle naked dashes ' , optOrArg printString ].
			opt
				ifNotNil: [ :theOpt | 
					theOpt argExpected
						ifTrue: [ 
							(optOrArg beginsWith: '-')
								ifTrue: [ 
									theOpt argRequired
										ifTrue: [ 
											self
												error:
													'Missing required argument for option ' , opt longName printString , ' [a]' ]
										ifFalse: [ theOpt markNoValue	"will pick up default value" ] ]
								ifFalse: [ theOpt value: optOrArg ] ]
						ifFalse: [ theOpt value: true	"set value to true, to indicate that the option WAS specified" ] ].
			(optOrArg beginsWith: '-')
				ifTrue: [ 
					(optOrArg beginsWith: '--')
						ifTrue: [ 
							| optKey |
							optKey := optOrArg copyFrom: 3 to: optOrArg size.
							(optKey indexOf: $= ifAbsent: [  ])
								ifNotNil: [ :index | 
									| arg |
									"long option with value"
									arg := optKey copyFrom: index + 1 to: optKey size.
									optKey := optKey copyFrom: 1 to: index - 1.
									opt := (specsDict at: 'long')
										at: optKey
										ifAbsent: [ self error: 'Unknown option ' , optKey printString , ' [a]' ].
									opt argExpected
										ifFalse: [ 
											self
												error:
													'Unexpected argument ' , arg printString , ' for option ' , optKey printString ].
									opt value: arg ]
								ifNil: [ 
									"naked long option"
									opt := (specsDict at: 'long')
										at: optKey
										ifAbsent: [ self error: 'Unknown option ' , optKey printString , ' [b]' ].
									opt argRequired
										ifTrue: [ 
											self
												error:
													'Missing required argument for option ' , optKey printString , ' [b]' ].
									opt argExpected
										ifTrue: [ opt markNoValue ]
										ifFalse: [ opt value: true ] ].
							opt := nil ]
						ifFalse: [ 
							| theOpts numOpts |
							"optOrArg beginsWith: '-'"
							theOpts := optOrArg copyFrom: 2 to: optOrArg size.
							numOpts := theOpts size.
							1 to: numOpts do: [ :index | 
								| optKey |
								optKey := (theOpts at: index) asString.
								opt := (specsDict at: 'short')
									at: optKey
									ifAbsent: [ self error: 'Unknown option ' , optKey printString , ' [c]' ].
								index < numOpts
									ifTrue: [ 
										"multiple options"
										opt argRequired
											ifTrue: [ 
												self
													error:
														'Missing required argument for option ' , opt longName printString , ' [c]' ].
										opt argExpected
											ifTrue: [ opt markNoValue ]
											ifFalse: [ opt value: true ] ]
									ifFalse: [ 
										opt argExpected
											ifFalse: [ 
												opt value: true.
												opt := nil ] ] ] ] ]
				ifFalse: [ 
					opt
						ifNil: [ 
							"naked arg"
							_positionalArgs add: optOrArg ]
						ifNotNil: [ 
							"op has already had it's option set"
							opt := nil ] ] ].
	opt
		ifNotNil: [ 
			"naked option"
			opt argRequired
				ifTrue: [ 
					self
						error:
							'Missing required argument for option ' , opt longName printString , ' [d]' ].
			opt argExpected
				ifTrue: [ opt markNoValue ]
				ifFalse: [ opt value: true ] ]
]

{ #category : 'script info' }
SuperDoitExecution >> isSolo [
	^ GsSession isSolo
]

{ #category : 'logging' }
SuperDoitExecution >> log: anObject [
	| stdout |
	stdout := GsFile stdout.
	self ston: anObject on: stdout.
	stdout lf
]

{ #category : 'logging' }
SuperDoitExecution >> logErrorMessage: aString [
	self stderr
		nextPutAll: aString;
		lf
]

{ #category : 'logging' }
SuperDoitExecution >> logMessage: aString [
	self stdout
		nextPutAll: aString;
		lf
]

{ #category : 'private' }
SuperDoitExecution >> noResult [
	"unique object to use a return value when no result should be written to stdout"

	^ _noResult ifNil: [ _noResult := Object new ]
]

{ #category : 'accessing' }
SuperDoitExecution >> optionsDict [
	^_optionsDict
]

{ #category : 'accessing' }
SuperDoitExecution >> optionsDict: object [
	_optionsDict := object
]

{ #category : 'accessing' }
SuperDoitExecution >> positionalArgs [
	^_positionalArgs
]

{ #category : 'accessing' }
SuperDoitExecution >> positionalArgs: object [
	_positionalArgs := object
]

{ #category : 'doit' }
SuperDoitExecution >> preDoitSpecLoad [
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	^ self preDoitSpecLoad: [  ]
]

{ #category : 'doit' }
SuperDoitExecution >> preDoitSpecLoad: specBlock [
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	| projectSet |
	self _loadSpecs isEmpty
		ifTrue: [ ^ self ].
	projectSet := RwProjectSetDefinition new.
	self _loadSpecs
		do: [ :spec | 
			specBlock cull: spec.
			spec resolve readProjectSet do: [ :project | projectSet addProject: project ] ].
	^ projectSet load
]

{ #category : 'accessing' }
SuperDoitExecution >> processDynamicSections: aSuperDoitCommandParser [
	"placeholder for picking up dynamic section content"

	"noop"
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

{ #category : 'logging' }
SuperDoitExecution >> stderr [
	^ GsFile stderr
]

{ #category : 'logging' }
SuperDoitExecution >> stdout [
	^ GsFile stdout 
]

{ #category : 'private' }
SuperDoitExecution >> ston: anObject on: aStream [
	STON put: anObject onStreamPretty: aStream
]

{ #category : 'help' }
SuperDoitExecution >> usage [
	| string |
	string := _usage copyReplaceAll: '$basename' with: self basename.
	self stdout nextPutAll: string.
	^ self noResult
]

{ #category : 'help' }
SuperDoitExecution >> usage: object [
	_usage := object
]
