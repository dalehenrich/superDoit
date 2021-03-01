Class {
	#name : 'SuperDoitCommandParser',
	#superclass : 'Object',
	#instVars : [
		'stream',
		'done',
		'doitResult',
		'specs',
		'superDoitExecutionClass',
		'instVarNames',
		'scriptArgs',
		'systemDictionary'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'instance creation' }
SuperDoitCommandParser class >> processInputFile [
	| args scriptArgStart argIndex scriptFile scriptArgs scriptArgIndex |
	args := System commandLineArguments.
	scriptArgStart := args indexOf: '--'.
	argIndex := scriptArgStart + 1.	"arg after initial --"
	(scriptArgStart <= 0 or: [ argIndex > args size ])
		ifTrue: [ self error: 'input file is expected to be specified on the command line' ].
	scriptFile := args at: argIndex.
	scriptArgIndex := args indexOf: '--' startingAt: argIndex + 1.
	scriptArgs := scriptArgIndex = 0
		ifTrue: [ #() ]
		ifFalse: [ args copyFrom: scriptArgIndex + 1 to: args size ].
	 
	^ self new 
		scriptArgs: scriptArgs;
		parseAndExecuteScriptFile: scriptFile asFileReference;
		yourself
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptArgs: aColl [
 scriptArgs := aColl
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptArgs [
^ scriptArgs ifNil: [ #() ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> doit: string [
	| instance |
	self superDoitExecutionClass compileMethod: 'doit ^ ' , string.
	instance := self superDoitExecutionClass new.
	instance scriptArgs: self scriptArgs.
 	instance displayResult: instance doit
]

{ #category : 'accessing' }
SuperDoitCommandParser >> done [
^ done ifNil: [ false ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> instVarNames [
	instVarNames ifNil: [ ^ #() ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> instVarNames: string [
	instVarNames := ('#(' , string , ')') evaluate
]

{ #category : 'commands' }
SuperDoitCommandParser >> method: string [
	self superDoitExecutionClass compileMethod: string
]

{ #category : 'parsing' }
SuperDoitCommandParser >> nextChunk [
	| str line |
	str := String new.
	[ stream atEnd not ]
		whileTrue: [ 
			line := stream nextLine trimTrailingSeparators.
			(line notEmpty and: [ line first = $% ])
				ifTrue: [ ^ str ].
			str
				addAll: line;
				lf ].
	self error: 'ran off end of file!'
]

{ #category : 'execution' }
SuperDoitCommandParser >> parseAndExecuteScriptFile: scriptFileReference [
	scriptFileReference
		readStreamDo: [ :fStream | 
			stream := ZnBufferedReadStream on: fStream.
			[ self done ] whileFalse: [ self processNextCommand ].
			^ doitResult ]
]

{ #category : 'parsing' }
SuperDoitCommandParser >> processNextCommand [
	| line words command firstChar |
	stream atEnd
		ifTrue: [ 
			done := true.
			^ self ].
	line := stream nextLine trimSeparators.
	words := line subStrings.
	command := words first asUppercase.
	((firstChar := command at: 1) == $! or: [ firstChar == $# ])
		ifTrue: [ ^ nil ].

	command = 'DOIT'
		ifTrue: [ ^ self doit: self nextChunk ].
	command = 'METHOD'
		ifTrue: [ ^ self method: self nextChunk ].
	command = 'INSVARS'
		ifTrue: [ ^ self instVarNames: self nextChunk ].
	command = 'SPECS'
		ifTrue: [ ^ self specSton: self nextChunk ].
	command = 'SPECURLS'
		ifTrue: [ ^ self specUrls: self nextChunk ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> specs [
	^ specs ifNil: [ specs := {} ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> specSton: string [
	| stonStream |
	stonStream := string readStreamPortable.
	[ stonStream atEnd ]
		whileFalse: [ 
			| obj |
			obj := STON fromStream: stonStream.
			obj _isArray
				ifTrue: [ self specs addAll: obj ]
				ifFalse: [ self specs add: obj ] ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> specUrls: string [
	| urlStream |
	urlStream := string readStreamPortable.
	[ urlStream atEnd ]
		whileFalse: [ 
			| url spec |
			url := urlStream nextLine.
			spec := RwSpecification fromUrl: url.
			self specs add: spec ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> superDoitExecutionClass [
	^ superDoitExecutionClass
		ifNil: [ 
			superDoitExecutionClass := SuperDoitExecution
				subclass: 'SuperDoitExecutionClass'
				instVarNames: self instVarNames
				classVars: #()
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> systemDictionary [
	^ systemDictionary
		ifNil: [ 
			System refreshTransientSymbolList.
			systemDictionary := SymbolDictionary new name: #'superDoitSymbolDict'.
			GsCurrentSession currentSession userProfile
				insertDictionary: systemDictionary
				at: 1.
			systemDictionary ]
]
