! superDoit fileout

! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'SuperDoitAbstractOption'
	instVarNames: #( longName shortName value )
	classVars: #( NotSet NoValue )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Option';
		immediateInvariant.
true.
%

doit
(SuperDoitAbstractOption
	subclass: 'SuperDoitAbstractOptionWithRequiredArgument'
	instVarNames: #( defaultValue )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Option';
		immediateInvariant.
true.
%

doit
(SuperDoitAbstractOptionWithRequiredArgument
	subclass: 'SuperDoitOptionalOptionWithRequiredArg'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Option';
		immediateInvariant.
true.
%

doit
(SuperDoitOptionalOptionWithRequiredArg
	subclass: 'SuperDoitRequiredOptionWithRequiredArg'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Option';
		immediateInvariant.
true.
%

doit
(SuperDoitAbstractOption
	subclass: 'SuperDoitOptionalOptionWithNoArg'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Option';
		immediateInvariant.
true.
%

doit
(Object
	subclass: 'SuperDoitCommand'
	instVarNames: #( chunk )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitCustomOptionsCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'CUSTOMOPTIONS';
		immediateInvariant.
true.
%

doit
(SuperDoitCustomOptionsCommand
	subclass: 'SuperDoitOptionsCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'OPTIONS';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitDoitCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'DOIT';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitExtensionMethodCommand'
	instVarNames: #( className isMeta )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'METHOD: <class-name>
CLASSMETHOD: <class-name>';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitInputCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'INPUT';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitInstVarNamesCommand'
	instVarNames: #( executed )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'INSTVARS';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitMethodCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'METHOD';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitProjectsHomeCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'PROJECTSHOME';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitScriptCommentCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: '#';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitSpecsCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'SPECS';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitSpecUrlsCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'SPECURLS';
		immediateInvariant.
true.
%

doit
(SuperDoitCommand
	subclass: 'SuperDoitUsageCommand'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		comment: 'USAGE';
		immediateInvariant.
true.
%

doit
(Object
	subclass: 'SuperDoitCommandDefinition'
	instVarNames: #( commands )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Command';
		immediateInvariant.
true.
%

doit
(Object
	subclass: 'SuperDoitCommandParser'
	instVarNames: #( done doitResult usage specs superDoitExecutionClass superDoitExecutionMetadataClass instVarNames scriptArgs scriptPath systemDictionary optionsDict projectsHome commandDefinition )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Core';
		immediateInvariant.
true.
%

doit
(Object
	subclass: 'SuperDoitExecution'
	instVarNames: #( _commandLine _scriptArgs _scriptPath _usage _noResult _positionalArgs _loadSpecs _optionsDict )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: SuperDoit_transientSymbolDictionary
	options: #()
)
		category: 'SuperDoit-Core';
		immediateInvariant.
true.
%

! Class implementation for 'SuperDoitAbstractOption'

!		Class methods for 'SuperDoitAbstractOption'

category: 'instance creation'
classmethod: SuperDoitAbstractOption
long: longName
	^ self new
		initialize;
		longName: longName;
		yourself
%

category: 'instance creation'
classmethod: SuperDoitAbstractOption
long: longName short: shortName
	^ self new
		initialize;
		longName: longName;
		shortName: shortName;
		yourself
%

category: 'accessing'
classmethod: SuperDoitAbstractOption
notSet
	^ NotSet ifNil: [ NotSet := Object new ]
%

category: 'accessing'
classmethod: SuperDoitAbstractOption
noValue
	^ NoValue ifNil: [ NoValue := Object new ]
%

!		Instance methods for 'SuperDoitAbstractOption'

category: 'testing'
method: SuperDoitAbstractOption
argExpected
	^ false
%

category: 'testing'
method: SuperDoitAbstractOption
argRequired
	^ false
%

category: 'accessing'
method: SuperDoitAbstractOption
defaultValue
	^ false
%

category: 'initialization'
method: SuperDoitAbstractOption
initialize
	value := self notSet
%

category: 'testing'
method: SuperDoitAbstractOption
isRequired
	^ false
%

category: 'accessing'
method: SuperDoitAbstractOption
longName
	^longName
%

category: 'accessing'
method: SuperDoitAbstractOption
longName: aString
	aString isValidIdentifier
		ifFalse: [ 
			self
				error:
					aString printString
						,
							' is an invalid long option name. Long option names are constrained to be a valid selector.' ].
	longName := aString
%

category: 'accessing'
method: SuperDoitAbstractOption
notSet
	^ self class notSet
%

category: 'accessing'
method: SuperDoitAbstractOption
noValue
	^ self class noValue
%

category: 'accessing'
method: SuperDoitAbstractOption
shortName
	^shortName
%

category: 'accessing'
method: SuperDoitAbstractOption
shortName: object
	shortName := object
%

category: 'accessing'
method: SuperDoitAbstractOption
value
	^ value == self notSet
		ifTrue: [ self defaultValue ]
		ifFalse: [ value ]
%

category: 'accessing'
method: SuperDoitAbstractOption
value: object
	value ~~ self notSet
		ifTrue: [ 
			self
				error:
					'The option ' , self longName printString , ' has already been processed.' ].
	value := object
%

category: 'testing'
method: SuperDoitAbstractOption
wasSet
	"answer true if the receiver was set on the command line"

	^ value ~~ self notSet
%

! Class implementation for 'SuperDoitAbstractOptionWithRequiredArgument'

!		Class methods for 'SuperDoitAbstractOptionWithRequiredArgument'

category: 'instance creation'
classmethod: SuperDoitAbstractOptionWithRequiredArgument
long: longName default: default
	^ self new
		initialize;
		longName: longName;
		defaultValue: default;
		yourself
%

category: 'instance creation'
classmethod: SuperDoitAbstractOptionWithRequiredArgument
long: longName short: shortName default: default
	^ self new
		initialize;
		longName: longName;
		shortName: shortName;
		defaultValue: default;
		yourself
%

!		Instance methods for 'SuperDoitAbstractOptionWithRequiredArgument'

category: 'testing'
method: SuperDoitAbstractOptionWithRequiredArgument
argExpected
	^ true
%

category: 'accessing'
method: SuperDoitAbstractOptionWithRequiredArgument
defaultValue
	^defaultValue
%

category: 'accessing'
method: SuperDoitAbstractOptionWithRequiredArgument
defaultValue: object
	defaultValue := object
%

category: 'accessing'
method: SuperDoitAbstractOptionWithRequiredArgument
markNoValue
	"mark with a noValue object that is unique when the optional options have been referenced on command line, should trigger use of defaultValue"

	(value ~~ self notSet and: [ value ~~ self noValue])
		ifTrue: [ 
			self
				error:
					'The option ' , self longName printString , ' has already been processed.' ].
	value := self noValue
%

category: 'accessing'
method: SuperDoitAbstractOptionWithRequiredArgument
value
	^ (value == self noValue or: [ value == self notSet ])
		ifTrue: [ self defaultValue ]
		ifFalse: [ value ]
%

! Class implementation for 'SuperDoitOptionalOptionWithRequiredArg'

!		Instance methods for 'SuperDoitOptionalOptionWithRequiredArg'

category: 'testing'
method: SuperDoitOptionalOptionWithRequiredArg
argRequired
	^ true
%

! Class implementation for 'SuperDoitRequiredOptionWithRequiredArg'

!		Class methods for 'SuperDoitRequiredOptionWithRequiredArg'

category: 'instance creation'
classmethod: SuperDoitRequiredOptionWithRequiredArg
long: longName default: default
	self
		error:
			'required options with required arguments have no default value, use long: instead'
%

category: 'instance creation'
classmethod: SuperDoitRequiredOptionWithRequiredArg
long: longName short: shortName default: default
	self
		error:
			'required options with required arguments have no default value, use long:short: instead'
%

!		Instance methods for 'SuperDoitRequiredOptionWithRequiredArg'

category: 'testing'
method: SuperDoitRequiredOptionWithRequiredArg
isRequired
	^ true
%

! Class implementation for 'SuperDoitCommand'

!		Class methods for 'SuperDoitCommand'

category: 'instance creation'
classmethod: SuperDoitCommand
chunk: aString
	^ self new
		chunk: aString;
		yourself
%

!		Instance methods for 'SuperDoitCommand'

category: 'accessing'
method: SuperDoitCommand
chunk
	^chunk
%

category: 'accessing'
method: SuperDoitCommand
chunk: object
	chunk := object
%

category: 'accessing'
method: SuperDoitCommand
commandString
	self subclassResponsibility: #'commandString'
%

category: 'execution'
method: SuperDoitCommand
executeAgainst: aCommandParser
	self subclassResponsibility: #'executeAgainst:'
%

category: 'execution'
method: SuperDoitCommand
executeAgainst: aCommandParser onErrorDo: errorBlock
	[ self executeAgainst: aCommandParser ]
		on: Error , Halt
		do: errorBlock
%

category: 'exporting'
method: SuperDoitCommand
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	writeStream
		nextPutAll: self commandString;
		lf;
		nextPutAll: self chunk;	"chunk has a trailing lf"
		nextPutAll: '%';
		lf
%

category: 'execution'
method: SuperDoitCommand
preClassCreationExecuteAgainst: aCommandParser
	"give all commands that need to be executed BEFORE class creation a chance to run"

	"noop by default"
%

! Class implementation for 'SuperDoitCustomOptionsCommand'

!		Instance methods for 'SuperDoitCustomOptionsCommand'

category: 'accessing'
method: SuperDoitCustomOptionsCommand
commandString
	^'customoptions'
%

category: 'execution'
method: SuperDoitCustomOptionsCommand
executeAgainst: aCommandParser
	| ivNames optionSpecs optionsDict |
	ivNames := aCommandParser instVarNames.
	optionSpecs := self optionSpecs: aCommandParser.
	optionsDict := Dictionary new.
	optionSpecs do: [ :spec | optionsDict at: spec longName put: spec ].
	aCommandParser optionsDict: optionsDict.
	optionSpecs
		do: [ :option | 
			| longName |
			longName := option longName.
			self
				compileMethod:
					longName , '  ^ (self optionsDict at: ' , longName printString , ') value'
				for: aCommandParser superDoitExecutionMetadataClass.

			self
				compileMethod:
					longName , ': optionValue (self optionsDict at:' , longName printString
						, ') value: optionValue'
				for: aCommandParser superDoitExecutionMetadataClass ]
%

category: 'accessing'
method: SuperDoitCustomOptionsCommand
optionSpecs: aCommandParser
	| ar |
	ar := self chunk evaluate.
	ar _isArray
		ifFalse: [ self error: 'Expected an Array of options: ' , ar printString ].
	^ ar
%

! Class implementation for 'SuperDoitOptionsCommand'

!		Instance methods for 'SuperDoitOptionsCommand'

category: 'accessing'
method: SuperDoitOptionsCommand
commandString
	^'options'
%

category: 'exporting'
method: SuperDoitOptionsCommand
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	"The first command in the list is always an option command ... normally empty, unless it is a custom options command"

	(super optionSpecs: commandParser) isEmpty
		ifFalse: [ 
			super
				exportTo: writeStream
				commandParser: commandParser
				executionClass: executionClass ]
%

category: 'accessing'
method: SuperDoitOptionsCommand
optionSpecs: aCommandParser
	^ aCommandParser standardOptionSpecs , (super optionSpecs: aCommandParser)
%

! Class implementation for 'SuperDoitDoitCommand'

!		Instance methods for 'SuperDoitDoitCommand'

category: 'accessing'
method: SuperDoitDoitCommand
commandString
	^'doit'
%

category: 'execution'
method: SuperDoitDoitCommand
executeAgainst: aCommandParser
	| instance |
	self
		compileMethod:
			'theDoit ^ ' , self chunk printString , ' evaluateInContext: self symbolList: '
				, self symbolListExpressionString
		for: aCommandParser superDoitExecutionMetadataClass.

	instance := aCommandParser superDoitExecutionClass new.
	instance class
		executionInstance: instance;
		commandParserInstance: aCommandParser.
	instance scriptPath: aCommandParser scriptPath.
	instance scriptArgs: aCommandParser scriptArgs.
	instance usage: aCommandParser usage.
	instance optionsDict: aCommandParser optionsDict.
	instance processDynamicSections: aCommandParser.
	instance _loadSpecs: aCommandParser specs.
	instance displayResult: instance doit
%

category: 'execution'
method: SuperDoitDoitCommand
executeAgainst: aCommandParser onErrorDo: errorBlock
	"errors during execution of doit are under script control"

	self executeAgainst: aCommandParser
%

category: 'exporting'
method: SuperDoitDoitCommand
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	"METHOD commands have been ignored on export. The instance side methods for executionClass will be exported in canonical order before the DOIT command"

	(executionClass selectors
		sort: [ :a :b | 
			"use Unicode sort order because private methods (leading $_) sort first"
			a _unicodeLessThan: b ])
		do: [ :sel | 
			| methodSource |
			methodSource := (executionClass compiledMethodAt: sel) sourceString.
			writeStream
				nextPutAll: 'method';
				lf;
				nextPutAll: methodSource.
			methodSource last == Character lf
				ifFalse: [ writeStream lf ].
			writeStream
				nextPutAll: '%';
				lf ].
	super
		exportTo: writeStream
		commandParser: commandParser
		executionClass: executionClass
%

! Class implementation for 'SuperDoitExtensionMethodCommand'

!		Class methods for 'SuperDoitExtensionMethodCommand'

category: 'instance creation'
classmethod: SuperDoitExtensionMethodCommand
chunk: aString className: className
	^ self new
		chunk: aString;
		className: className;
		yourself
%

category: 'instance creation'
classmethod: SuperDoitExtensionMethodCommand
chunk: aString className: className isMeta: aBool
	^ self new
		chunk: aString;
		className: className;
		isMeta: aBool;
		yourself
%

!		Instance methods for 'SuperDoitExtensionMethodCommand'

category: 'accessing'
method: SuperDoitExtensionMethodCommand
className
	^className
%

category: 'accessing'
method: SuperDoitExtensionMethodCommand
className: object
	className := object
%

category: 'accessing'
method: SuperDoitExtensionMethodCommand
commandString
	^ self isMeta
		ifTrue: [ 'classmethod: ' , self className ]
		ifFalse: [ 'method: ' , self className ]
%

category: 'execution'
method: SuperDoitExtensionMethodCommand
executeAgainst: aCommandParser
	(SuperDoitExecution globalNamed: self className)
		ifNotNil: [ :class | 
			| beh |
			beh := self isMeta
				ifTrue: [ class class ]
				ifFalse: [ class ].
			self compileMethod: self chunk for: beh ]
		ifNil: [ self error: 'No class ' , className printString , ' found' ]
%

category: 'accessing'
method: SuperDoitExtensionMethodCommand
isMeta
	^ isMeta ifNil: [ false ]
%

category: 'accessing'
method: SuperDoitExtensionMethodCommand
isMeta: object
	isMeta := object
%

! Class implementation for 'SuperDoitInputCommand'

!		Instance methods for 'SuperDoitInputCommand'

category: 'accessing'
method: SuperDoitInputCommand
commandString
	^'input'
%

category: 'execution'
method: SuperDoitInputCommand
executeAgainst: aCommandParser

	| inputFileStream |
	inputFileStream := ReadStreamPortable on: self chunk.
	[ inputFileStream atEnd ]
		whileFalse: [ 
			| filePath |
			filePath := inputFileStream nextLine trimSeparators.
			GsFileIn fromServerPath: filePath ]
%

! Class implementation for 'SuperDoitInstVarNamesCommand'

!		Instance methods for 'SuperDoitInstVarNamesCommand'

category: 'accessing'
method: SuperDoitInstVarNamesCommand
commandString
	^'instvars'
%

category: 'execution'
method: SuperDoitInstVarNamesCommand
executeAgainst: aCommandParser
	self executed ifTrue: [ ^ self ].
	aCommandParser
		instVarNames: aCommandParser instVarNames , ('#(' , self chunk , ')') evaluate.
	self executed: true
%

category: 'accessing'
method: SuperDoitInstVarNamesCommand
executed
	^ executed ifNil: [ executed := false ]
%

category: 'accessing'
method: SuperDoitInstVarNamesCommand
executed: object
	executed := object
%

category: 'execution'
method: SuperDoitInstVarNamesCommand
preClassCreationExecuteAgainst: aCommandParser
	"give all commands that need to be executed BEFORE class creation a chance to run"

	self executeAgainst: aCommandParser
%

! Class implementation for 'SuperDoitMethodCommand'

!		Instance methods for 'SuperDoitMethodCommand'

category: 'accessing'
method: SuperDoitMethodCommand
commandString
	^'method'
%

category: 'execution'
method: SuperDoitMethodCommand
executeAgainst: aCommandParser
	self compileMethod: self chunk for: aCommandParser superDoitExecutionClass
%

category: 'exporting'
method: SuperDoitMethodCommand
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	"METHOD commands are ignored on export. The instance side methods for executionClass will be exported in canonical order before the DOIT command"
%

! Class implementation for 'SuperDoitProjectsHomeCommand'

!		Instance methods for 'SuperDoitProjectsHomeCommand'

category: 'accessing'
method: SuperDoitProjectsHomeCommand
commandString
	^'projectshome'
%

category: 'execution'
method: SuperDoitProjectsHomeCommand
executeAgainst: aCommandParser
	| projectsHomeStream |
	SuperDoitExecution
		globalNamed: #'Rowan'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specs command' ].
	projectsHomeStream := self chunk readStreamPortable.
	[ projectsHomeStream atEnd ]
		whileFalse: [ 
			"last declaration wins"
			aCommandParser projectsHome: projectsHomeStream nextLine ]
%

! Class implementation for 'SuperDoitScriptCommentCommand'

!		Instance methods for 'SuperDoitScriptCommentCommand'

category: 'accessing'
method: SuperDoitScriptCommentCommand
commandString
	self shouldNotImplement: #commandString
%

category: 'execution'
method: SuperDoitScriptCommentCommand
executeAgainst: aCommandParser
	"noop"
%

category: 'exporting'
method: SuperDoitScriptCommentCommand
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	writeStream
		nextPutAll: self chunk;
		lf
%

! Class implementation for 'SuperDoitSpecsCommand'

!		Instance methods for 'SuperDoitSpecsCommand'

category: 'accessing'
method: SuperDoitSpecsCommand
commandString
	^'specs'
%

category: 'execution'
method: SuperDoitSpecsCommand
executeAgainst: aCommandParser
	| stonStream |
	SuperDoitExecution
		globalNamed: #'Rowan'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specs command' ].
	stonStream := self chunk readStreamPortable.
	[ stonStream atEnd ]
		whileFalse: [ 
			| obj |
			obj := (SuperDoitExecution globalNamed: #'STON') fromStream: stonStream.
			obj _isArray
				ifTrue: [ aCommandParser specs addAll: obj ]
				ifFalse: [ aCommandParser specs add: obj ] ]
%

! Class implementation for 'SuperDoitSpecUrlsCommand'

!		Instance methods for 'SuperDoitSpecUrlsCommand'

category: 'accessing'
method: SuperDoitSpecUrlsCommand
commandString
	^'specurls'
%

category: 'execution'
method: SuperDoitSpecUrlsCommand
executeAgainst: aCommandParser
	| urlStream rowanSpecificationClass |
	rowanSpecificationClass := SuperDoitExecution
		globalNamed: #'RwSpecification'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specurls command' ].
	urlStream := self chunk readStreamPortable.
	[ urlStream atEnd ]
		whileFalse: [ 
			| url |
			url := urlStream nextLine.
			aCommandParser specs add: (rowanSpecificationClass fromUrl: url) ]
%

! Class implementation for 'SuperDoitUsageCommand'

!		Instance methods for 'SuperDoitUsageCommand'

category: 'accessing'
method: SuperDoitUsageCommand
commandString
	^'usage'
%

category: 'execution'
method: SuperDoitUsageCommand
executeAgainst: aCommandParser
	aCommandParser usage: self chunk
%

! Class implementation for 'SuperDoitCommandDefinition'

!		Instance methods for 'SuperDoitCommandDefinition'

category: 'creation'
method: SuperDoitCommandDefinition
addCommand: aSuperDoitCommand
	self commands add: aSuperDoitCommand
%

category: 'accessing'
method: SuperDoitCommandDefinition
commands
	^ commands ifNil: [ commands := OrderedCollection new ]
%

category: 'execution'
method: SuperDoitCommandDefinition
executeAgainst: aCommandParser onErrorDo: errorBlock
	self commands
		do: [ :command | command executeAgainst: aCommandParser onErrorDo: errorBlock ]
%

category: 'export'
method: SuperDoitCommandDefinition
exportCommandsTo: scriptFilePath commandParser: commandParser executionClass: executionClass
	| writeStream |
	writeStream := GsFile openWriteOnServer: scriptFilePath.
	writeStream
		ifNil: [ self error: 'Could not open ' , scriptFilePath , 'for writing' ].
	[ 
	self commands
		do: [ :command | 
			command
				exportTo: writeStream
				commandParser: commandParser
				executionClass: executionClass ] ]
		ensure: [ writeStream close ]
%

category: 'execution'
method: SuperDoitCommandDefinition
preClassCreationExecuteAgainst: aCommandParser
	"give all commands that need to be executed BEFORE class creation a chance to run"

	self commands
		do: [ :command | command preClassCreationExecuteAgainst: aCommandParser ]
%

! Class implementation for 'SuperDoitCommandParser'

!		Class methods for 'SuperDoitCommandParser'

category: 'accessing'
classmethod: SuperDoitCommandParser
transientSymbolDictionaryName
	"must match values using superdoit_solo"

	^ #'SuperDoit_transientSymbolDictionary'
%

!		Instance methods for 'SuperDoitCommandParser'

category: 'commands'
method: SuperDoitCommandParser
classMethod: aString className: className
	^ SuperDoitExtensionMethodCommand
		chunk: aString
		className: className
		isMeta: true
%

category: 'accessing'
method: SuperDoitCommandParser
commandDefinition
	^ commandDefinition
		ifNil: [ commandDefinition := SuperDoitCommandDefinition new ]
%

category: 'commands'
method: SuperDoitCommandParser
customOptions: string
	^ SuperDoitCustomOptionsCommand chunk: string
%

category: 'commands'
method: SuperDoitCommandParser
doit: aString
	^ SuperDoitDoitCommand chunk: aString
%

category: 'accessing'
method: SuperDoitCommandParser
done
^ done ifNil: [ false ]
%

category: 'private'
method: SuperDoitCommandParser
fileStreamFor: aFilePath
	^ (System myUserProfile objectNamed: 'FileStream')
		ifNotNil: [ :fileStreamClass | fileStreamClass fileNamed: aFilePath ]
		ifNil: [ GsFile openReadOnServer: aFilePath ]
%

category: 'commands'
method: SuperDoitCommandParser
input: aString
	^ SuperDoitInputCommand chunk: aString
%

category: 'accessing'
method: SuperDoitCommandParser
instVarNames
	^ instVarNames ifNil: [ instVarNames := {} ]
%

category: 'accessing'
method: SuperDoitCommandParser
instVarNames: anArray
	instVarNames := anArray
%

category: 'commands'
method: SuperDoitCommandParser
instVarNamesCommand: string
	^ SuperDoitInstVarNamesCommand chunk: string
%

category: 'commands'
method: SuperDoitCommandParser
method: aString
	^ SuperDoitMethodCommand chunk: aString
%

category: 'commands'
method: SuperDoitCommandParser
method: aString className: className
	^ SuperDoitExtensionMethodCommand chunk: aString className: className
%

category: 'parsing'
method: SuperDoitCommandParser
nextChunk
	| str line strm |
	str := String new.
	strm := self stream.
	[ strm atEnd not ]
		whileTrue: [ 
			line := strm nextLine trimTrailingSeparators.
			(line notEmpty and: [ line first = $% ])
				ifTrue: [ ^ str ].
			str
				addAll: line;
				lf ].
	self error: 'ran off end of file!'
%

category: 'commands'
method: SuperDoitCommandParser
options: string
	^ SuperDoitOptionsCommand chunk: string
%

category: 'accessing'
method: SuperDoitCommandParser
optionsDict
	^optionsDict
%

category: 'accessing'
method: SuperDoitCommandParser
optionsDict: object
	optionsDict := object
%

category: 'parsing'
method: SuperDoitCommandParser
parseAndExecuteScriptFile: scriptFilePath
	"keep a transient reference to the stream in case the receiver is persisted"

	self stream: (self fileStreamFor: scriptFilePath).
	[ 
	[ self done ]
		whileFalse: [ 
			self processNextCommand
				ifNotNil: [ :command | self commandDefinition addCommand: command ] ].
	optionsDict
		ifNil: [ 
			"no options specified, so go with the standard options and add it at the beginning of commands"
			self commandDefinition commands
				addFirst: (SuperDoitOptionsCommand chunk: '{}') ].
	self commandDefinition preClassCreationExecuteAgainst: self.	"make a pass to ensure that all commands that need to be processed BEFORE class creation get a chance to run (i'm looking at you SuperDoitInstVarNamesCommand"
	self commandDefinition
		executeAgainst: self
		onErrorDo: [ :error | 
			| listenForDebug exitClientErrorClass |
			"this block is intended to handle any errors that result in the execution of commands ... errors during doit command are expected to be handled elsewhere"
			exitClientErrorClass := SuperDoitExecution globalNamed: 'ExitClientError'.
			exitClientErrorClass
				ifNotNil: [ 
					(error isKindOf: exitClientErrorClass)
						ifTrue: [ 
							"honor exit client request"
							error pass ] ].
			listenForDebug := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			(SuperDoitExecution _stdoutIsNotTerminal or: [ listenForDebug ])
				ifTrue: [ 
					"stdout is not a Terminal, so need to dump stack in the event of an error"
					GsFile
						gciLogServer: '---------------------';
						gciLogServer: 'Unhandled Error in script: ' , scriptFilePath;
						gciLogServer: '---------------------';
						gciLogServer: error printString;
						gciLogServer: '---------------------';
						gciLogServer: (GsProcess stackReportToLevel: 300);
						gciLogServer: '---------------------';
						gciLogServer: 'GsProcess @' , GsProcess _current asOop printString;
						gciLogServer: '---------------------'.
					listenForDebug
						ifTrue: [ error pass ].
					exitClientErrorClass
						ifNotNil: [ :class | 
							"3.6.x and beyond"
							GsFile stderr
								nextPutAll: error printString;
								lf.
							class signal: error printString status: 1	"does not return" ] ].
			error pass ].
	^ doitResult ]
		ensure: [ self stream close ]
%

category: 'parsing'
method: SuperDoitCommandParser
processNextCommand
	| line words command commandSelector strm |
	strm := self stream.
	strm atEnd
		ifTrue: [ 
			done := true.
			^ nil ].
	line := strm nextLine trimSeparators.
	words := line subStrings.
	words isEmpty
		ifTrue: [ ^ nil ].

	command := words first asUppercase.
	(command at: 1) == $#
		ifTrue: [ ^ self scriptComment: line ].
	command = 'DOIT'
		ifTrue: [ ^ self doit: self nextChunk ].
	command = 'METHOD'
		ifTrue: [ ^ self method: self nextChunk ].
	command = 'METHOD:'
		ifTrue: [ ^ self method: self nextChunk className: (words at: 2) ].
	command = 'CLASSMETHOD:'
		ifTrue: [ ^ self classMethod: self nextChunk className: (words at: 2) ].
	command = 'INPUT'
		ifTrue: [ ^ self input: self nextChunk ].
	command = 'OPTIONS'
		ifTrue: [ ^ self options: self nextChunk ].
	command = 'CUSTOMOPTIONS'
		ifTrue: [ ^ self customOptions: self nextChunk ].
	command = 'INSTVARS'
		ifTrue: [ ^ self instVarNamesCommand: self nextChunk ].
	command = 'PROJECTSHOME'
		ifTrue: [ ^ self projectsHomeCommand: self nextChunk ].
	command = 'SPECS'
		ifTrue: [ ^ self specsCommand: self nextChunk ].
	command = 'SPECURLS'
		ifTrue: [ ^ self specUrls: self nextChunk ].
	command = 'USAGE'
		ifTrue: [ ^ self usageCommand: self nextChunk ].
	commandSelector := (command asLowercase , ':') asSymbol.
	(self respondsTo: commandSelector)
		ifTrue: [ ^ self perform: commandSelector with: self nextChunk ].
	self error: 'Unknown command ' , command printString
%

category: 'accessing'
method: SuperDoitCommandParser
projectsHome
	^ projectsHome
%

category: 'accessing'
method: SuperDoitCommandParser
projectsHome: aString
	projectsHome := aString
%

category: 'commands'
method: SuperDoitCommandParser
projectsHomeCommand: string
	^ SuperDoitProjectsHomeCommand chunk: string
%

category: 'accessing'
method: SuperDoitCommandParser
scriptArgs
^ scriptArgs ifNil: [ #() ]
%

category: 'accessing'
method: SuperDoitCommandParser
scriptArgs: aColl
 scriptArgs := aColl
%

category: 'commands'
method: SuperDoitCommandParser
scriptComment: aString
	^ SuperDoitScriptCommentCommand chunk: aString
%

category: 'accessing'
method: SuperDoitCommandParser
scriptPath
	^ scriptPath
%

category: 'accessing'
method: SuperDoitCommandParser
specs
	^ specs ifNil: [ specs := {} ]
%

category: 'commands'
method: SuperDoitCommandParser
specsCommand: string
	^ SuperDoitSpecsCommand chunk: string
%

category: 'commands'
method: SuperDoitCommandParser
specUrls: string
	^ SuperDoitSpecUrlsCommand chunk: string
%

category: 'accessing'
method: SuperDoitCommandParser
standardOptionSpecs
	^ {(SuperDoitOptionalOptionWithNoArg long: 'help' short: 'h').
	(SuperDoitOptionalOptionWithNoArg long: 'debug' short: 'D').
	(SuperDoitOptionalOptionWithNoArg long: 'debugGem')}
%

category: 'accessing'
method: SuperDoitCommandParser
stream
	^ SessionTemps current at: #'_SuperDoit_command_parser_input_stream' otherwise: nil
%

category: 'accessing'
method: SuperDoitCommandParser
stream: aFileStream
	SessionTemps current at: #'_SuperDoit_command_parser_input_stream' put: aFileStream
%

category: 'accessing'
method: SuperDoitCommandParser
superDoitExecutionClass
	^ superDoitExecutionClass
		ifNil: [ 
			superDoitExecutionClass := self superDoitExecutionMetadataClass
				subclass: 'SuperDoitExecutionClass'
				instVarNames: self instVarNames
				classVars: #()
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary ]
%

category: 'accessing'
method: SuperDoitCommandParser
superDoitExecutionMetadataClass
	^ superDoitExecutionMetadataClass
		ifNil: [ 
			superDoitExecutionMetadataClass := SuperDoitExecution
				subclass: 'SuperDoitExecutionMetadataClass'
				instVarNames: #()
				classVars: #('ExecutionInstance' 'CommandParserInstance')
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary.
			superDoitExecutionMetadataClass class
				compileMethod: 'executionInstance: anObject ExecutionInstance := anObject'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod: 'executionInstance ^ ExecutionInstance'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod:
						'commandParserInstance: anObject CommandParserInstance := anObject'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod: 'commandParserInstance ^ CommandParserInstance'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				yourself.
			superDoitExecutionMetadataClass ]
%

category: 'accessing'
method: SuperDoitCommandParser
usage
	"trimRight so that solo script don't have trailing whitespace in EXAMPLES "

	^ usage
		ifNil: [ 
			| stoneArgs stoneName |
			SuperDoitExecution isSolo
				ifTrue: [ stoneName := stoneArgs := '' ]
				ifFalse: [ 
					stoneName := '-- gs_360'.
					stoneArgs := ' [-- [<stone-name> [<topaz-command-line-args>] ] ]' ].
			^ '-----
USAGE $basename [--help | -h] [--debug | -D] [--debugGem]' , stoneArgs
				,
					'

OPTIONS
  -h, --help      display usage message
  -D, --debug     bring up topaz debugger in the event of a script error
  --debugGem      If terminal is connected to stdout, bring up debugger. If not,
                  dump stack to stdout and wait for topaz to attach using topaz
                  DEBUGGEM command.

EXAMPLES
  $basename --help' , ('  ' , stoneName) trimRight
				,
					'
  $basename -h' , ('      ' , stoneName) trimRight
				,
					'
  $basename -D' , ('      ' , stoneName) trimRight
				,
					'
  $basename --debugGem' , ('      ' , stoneName) trimRight
				,
					'
  $basename' , ('         ' , stoneName) trimRight
				,
					'
-----
' ]
%

category: 'accessing'
method: SuperDoitCommandParser
usage: string
	"any env var refs in string should be substituted upon display"
	usage := string
%

category: 'commands'
method: SuperDoitCommandParser
usageCommand: string
	^ SuperDoitUsageCommand chunk: string
%

! Class implementation for 'SuperDoitExecution'

!		Class methods for 'SuperDoitExecution'

category: 'utiities'
classmethod: SuperDoitExecution
globalNamed: aString
	"return nil if global not defined"

	^ GsSession currentSession objectNamed: aString asSymbol
%

category: 'utiities'
classmethod: SuperDoitExecution
globalNamed: aString ifAbsent: absentBlock
	^ (self globalNamed: aString) ifNil: absentBlock
%

category: 'utiities'
classmethod: SuperDoitExecution
_stdoutIsNotTerminal
	^ GsFile stdout isTerminal not
%

!		Instance methods for 'SuperDoitExecution'

category: 'command line'
method: SuperDoitExecution
commandLine
	^ _commandLine
		ifNil: [ 
			| stream |
			stream := WriteStream on: String new.
			stream
				nextPutAll: self basename;
				space.
			1 to: _scriptArgs size do: [ :index | 
				stream
					nextPutAll: (_scriptArgs at: index);
					space ].
			_commandLine := stream contents ]
%

category: 'command line'
method: SuperDoitExecution
commandLine: aString
	_commandLine := aString
%

category: 'command line'
method: SuperDoitExecution
commandLineSummary
	| opts |
	opts := Dictionary new.
	self optionsDict do: [:option |
		option wasSet
			ifTrue: [ opts at: option longName put: option value ] ].
	^ Dictionary new
		at: 'options' put: opts;
		at: 'args' put: self positionalArgs; 
		yourself.
%

category: 'logging'
method: SuperDoitExecution
displayResult: anObject
	anObject ~~ self noResult
		ifTrue: [ 
			| stdout |
			stdout := self stdout.
			(stdout respondsTo: #'print:')
				ifTrue: [ self ston: anObject on: stdout ]
				ifFalse: [ 
					| strm |
					"workaround for https://github.com/dalehenrich/superDoit/issues/18"
					strm := WriteStream on: String new.
					self ston: anObject on: strm.
					self stdout nextPutAll: strm contents ].
		stdout lf]
%

category: 'script info'
method: SuperDoitExecution
executionStoneName
	^GsNetworkResourceString currentStoneName
%

category: 'script execution'
method: SuperDoitExecution
getAndVerifyOptions
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
%

category: 'command line'
method: SuperDoitExecution
getOpts
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
							(self _string: optOrArg beginsWith: '-')
								ifTrue: [ 
									theOpt argRequired
										ifTrue: [ 
											self
												error:
													'Missing required argument for option ' , opt longName printString , ' [a]' ]
										ifFalse: [ theOpt markNoValue	"will pick up default value" ] ]
								ifFalse: [ theOpt value: optOrArg ] ]
						ifFalse: [ theOpt value: true	"set value to true, to indicate that the option WAS specified" ] ].
			(self _string: optOrArg beginsWith: '-')
				ifTrue: [ 
					(self _string: optOrArg beginsWith: '--')
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
							"self _string: optOrArg beginsWith: '-'"
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
%

category: 'accessing'
method: SuperDoitExecution
globalNamed: aString
	^ self class
		globalNamed: aString
		ifAbsent: [ self error: 'The global named ' , aString printString , ' was not found.' ]
%

category: 'accessing'
method: SuperDoitExecution
globalNamed: aString ifAbsent: absentBlock
	^ self class globalNamed: aString ifAbsent: absentBlock
%

category: 'script info'
method: SuperDoitExecution
isSolo
	^ SuperDoitExecution isSolo
%

category: 'logging'
method: SuperDoitExecution
log: anObject
	| stdout |
	stdout := GsFile stdout.
	self ston: anObject on: stdout.
	stdout lf
%

category: 'logging'
method: SuperDoitExecution
logErrorMessage: aString
	self stderr
		nextPutAll: aString;
		lf
%

category: 'logging'
method: SuperDoitExecution
logMessage: aString
	self stdout
		nextPutAll: aString;
		lf
%

category: 'private'
method: SuperDoitExecution
noResult
	"unique object to use a return value when no result should be written to stdout"

	^ _noResult ifNil: [ _noResult := Object new ]
%

category: 'accessing'
method: SuperDoitExecution
optionsDict
	^_optionsDict
%

category: 'accessing'
method: SuperDoitExecution
optionsDict: object
	_optionsDict := object
%

category: 'persist'
method: SuperDoitExecution
persist
	"Arrange to add the transient symbol dictionary to the peristent symbol list, so that 
		the script can be edited in a class browser."

	"Use export to rewrite the script file after editing"

	| transientSymbolDictionaryAssoc |
	transientSymbolDictionaryAssoc := GsCurrentSession currentSession symbolList
		resolveSymbol:
			self class commandParserInstance class transientSymbolDictionaryName.
	System myUserProfile symbolList
		add: transientSymbolDictionaryAssoc value
		before: UserGlobals.
	self stdout
		nextPutAll: 'saved ' , transientSymbolDictionaryAssoc key printString;
		lf.
	^ System commit
%

category: 'accessing'
method: SuperDoitExecution
positionalArgs
	^_positionalArgs
%

category: 'accessing'
method: SuperDoitExecution
positionalArgs: object
	_positionalArgs := object
%

category: 'doit'
method: SuperDoitExecution
preDoitSpecLoad
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	^ self preDoitSpecLoad: [  ]
%

category: 'doit'
method: SuperDoitExecution
preDoitSpecLoad: specBlock
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	| projectSet rowanProjectSetDefinitionClass rowanVersion rowanClass rowanSemanticVersionNumberClass |
	self _loadSpecs isEmpty
		ifTrue: [ ^ self ].
	rowanProjectSetDefinitionClass := SuperDoitExecution
		globalNamed: #'RwProjectSetDefinition'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specurls command' ].
	rowanClass := SuperDoitExecution globalNamed: 'Rowan'.
	rowanSemanticVersionNumberClass := SuperDoitExecution
		globalNamed: 'RwSemanticVersionNumber'.
	rowanVersion := (rowanClass respondsTo: #'version')
		ifTrue: [ rowanClass version ]
		ifFalse: [ rowanVersion := rowanSemanticVersionNumberClass fromString: '1.2.0' ].
	rowanVersion < (rowanSemanticVersionNumberClass fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					self class commandParserInstance projectsHome
						ifNotNil: [ :projectsHome | 
							"if projectsHome command is present, then prime the spec with the value"
							spec projectsHome: projectsHome ].
					specBlock cull: spec.
					spec resolve readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ].
	rowanVersion >= (rowanSemanticVersionNumberClass fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					specBlock cull: spec.
					spec resolveProject readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ]
%

category: 'accessing'
method: SuperDoitExecution
processDynamicSections: aSuperDoitCommandParser
	"placeholder for picking up dynamic section content"

	"noop"
%

category: 'accessing'
method: SuperDoitExecution
scriptArgs
	^ _scriptArgs ifNil: [ #() ]
%

category: 'accessing'
method: SuperDoitExecution
scriptArgs: aColl
	_scriptArgs := aColl
%

category: 'accessing'
method: SuperDoitExecution
scriptPath
	^ _scriptPath
%

category: 'logging'
method: SuperDoitExecution
stderr
	^ GsFile stderr
%

category: 'logging'
method: SuperDoitExecution
stdout
	^ GsFile stdout 
%

category: 'private'
method: SuperDoitExecution
ston: anObject on: aStream
	| ston |
	ston := SuperDoitExecution globalNamed: #'STON'.
	(ston notNil and: [ aStream respondsTo: #'print:' ])
		ifTrue: [ ston put: anObject onStreamPretty: aStream ]
		ifFalse: [ 
			"if STON is not present or GsFile>>print: not implemented, then our best bet is to print the object"
			aStream
				nextPutAll: anObject printString;
				lf ]
%

category: 'help'
method: SuperDoitExecution
usage
	| string |
	string := _usage copyReplaceAll: '$basename' with: self basename.
	self stdout nextPutAll: string.
	^ self noResult
%

category: 'help'
method: SuperDoitExecution
usage: object
	_usage := object
%

category: 'accessing'
method: SuperDoitExecution
_loadSpecs
	^ _loadSpecs
%

category: 'accessing'
method: SuperDoitExecution
_loadSpecs: specs
	_loadSpecs := specs
%

category: 'private'
method: SuperDoitExecution
_specsDict
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
%

category: 'private'
method: SuperDoitExecution
_string: aString beginsWith: prefix
	"in-place implmentation of beginsWith: ... 3.4.5 and older don't implement beginsWith: "

	(prefix isEmpty or: [ aString size < prefix size ])
		ifTrue: [ ^ false ]
		ifFalse: [ 
			1 to: prefix size do: [ :index | 
				(aString at: index) ~= (prefix at: index)
					ifTrue: [ ^ false ] ] ].
	^ true
%

! Class extensions for 'SuperDoitCommand'

!		Instance methods for 'SuperDoitCommand'

category: '*superdoit-core31-4'
method: SuperDoitCommand
compileMethod: methodSource for: aBehavior
	aBehavior 
		compileMethod: methodSource 
		dictionaries: GsCurrentSession currentSession symbolList 
		category: 'superdoit' 
		environmentId: 0
%

category: '*superdoit-core31-5'
method: SuperDoitCommand
symbolListExpressionString
	^ 'GsCurrentSession currentSession symbolList'
%

! Class extensions for 'SuperDoitCommandParser'

!		Class methods for 'SuperDoitCommandParser'

category: '*superdoit-stone-core31-5'
classmethod: SuperDoitCommandParser
processInputFile
	"command line looks like the following:
		<path-to-topaz>/topaz <topaz arguments> -- <script-file-path> -- <script-args>
	"

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
		scriptPath: scriptFile;
		scriptArgs: scriptArgs;
		parseAndExecuteScriptFile: scriptFile;
		yourself
%

!		Instance methods for 'SuperDoitCommandParser'

category: '*superdoit-stone-core'
method: SuperDoitCommandParser
scriptPath: aFilePath
	scriptPath := aFilePath
%

category: '*superdoit-core31-5'
method: SuperDoitCommandParser
systemDictionary
	"install the script class in a symbol dictionary in the transient symbol list ... 
		we do not want the class persisted"

	^ systemDictionary
		ifNil: [ 
			| sess symbolList name |
			sess := GsCurrentSession currentSession.
			symbolList := sess symbolList.	"transient symbol list"
			name := self class transientSymbolDictionaryName.
			^ systemDictionary := (symbolList resolveSymbol: name)
				ifNotNil: [ :assoc | assoc value ]
				ifNil: [ 
					systemDictionary := SymbolDictionary new name: name.
					symbolList insertObject: systemDictionary at: 1 ] ]
%

! Class extensions for 'SuperDoitExecution'

!		Class methods for 'SuperDoitExecution'

category: '*superdoit-core31-5'
classmethod: SuperDoitExecution
exportTo: scriptPath
	"export the 'persist'ed class to disk, writing in canonical format. New instance 
		variables will be added to instvar command and all instance-side methods in 
		reciever will be written out to the superdoit script file along with the original 
		non-method commands"

	| commandParser scriptFileRef |
	self name == #'SuperDoitExecutionClass'
		ifFalse: [ 
			self
				error:
					'export should only be performed on the SuperDoitExecutionClass class' ].
	commandParser := self commandParserInstance.
	scriptFileRef := scriptPath asFileReference.
	scriptFileRef exists
		ifFalse: [ self error: 'cannot find the script file ', scriptFileRef pathString printString ].
	commandParser commandDefinition exportCommandsTo: scriptFileRef commandParser: commandParser executionClass: self.
%

category: '*superdoit-core31-4'
classmethod: SuperDoitExecution
isSolo
	^ false
%

!		Instance methods for 'SuperDoitExecution'

category: '*superdoit-stone-core'
method: SuperDoitExecution
basename
	self _splitName: self scriptPath to: [ :parentPath :basename | ^ basename ]
%

category: '*superdoit-stone-core'
method: SuperDoitExecution
dirname
	self _splitName: self scriptPath to: [ :parentPath :basename | ^ parentPath ]
%

category: '*superdoit-core31-4'
method: SuperDoitExecution
doit
	"standard option handling ... for customization override in script"

	"
		Without the -S option, we have to use `output push /dev/null only` to 
		suppress the echoing of topaz commands used to implement superdoit, however,
		when there is an error, we need to dump the error message to stdout and 
		prompt the user to exit or do `output pop` to debug
	"

	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit
%

category: '*superdoit-core31-5'
method: SuperDoitExecution
exit: message withStatus: statusInteger
	"exiting image with an exit status not supported until 3.6.0"

	self logErrorMessage: message.
	System logout
%

category: '*superdoit-core31-5'
method: SuperDoitExecution
exitWithStatus: statusInteger
	"exiting image with an exit status not supported until 3.6.0"

	System logout
%

category: '*superdoit-stone-core'
method: SuperDoitExecution
scriptPath: aFilePath
	_scriptPath := aFilePath
%

category: '*superdoit-stone-core'
method: SuperDoitExecution
_splitName: fullName to: pathAndNameBlock
	"Take the file name and convert it to the path name of a directory and a local file name within that directory. FileName must be of the form: <dirPath><delimiter><localName>, where <dirPath><delimiter> is optional. The <dirPath> part may contain delimiters."

	| delimiter i dirName localName |
	delimiter := $/.
	(i := fullName findLast: [ :c | c = delimiter ]) = 0
		ifTrue: [ 
			dirName := String new.
			localName := fullName ]
		ifFalse: [ 
			dirName := fullName copyFrom: 1 to: (i - 1 max: 1).
			localName := fullName copyFrom: i + 1 to: fullName size ].
	^ pathAndNameBlock value: dirName value: localName
%

