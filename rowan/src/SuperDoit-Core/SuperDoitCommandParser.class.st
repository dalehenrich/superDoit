Class {
	#name : 'SuperDoitCommandParser',
	#superclass : 'Object',
	#instVars : [
		'stream',
		'done',
		'doitResult',
		'usage',
		'specs',
		'superDoitExecutionClass',
		'instVarNames',
		'scriptArgs',
		'scriptPath',
		'systemDictionary',
		'optionSpecs',
		'projectsHome',
		'commandDefinition'
	],
	#category : 'SuperDoit-Core'
}

{ #category : 'instance creation' }
SuperDoitCommandParser class >> processInputFile [
	"command line looks like the following:
		<path-to-topaz>/topaz <topaz arguments> -- <script-file-path> -- <script-args>
	"

	| args scriptArgStart argIndex scriptPath scriptFile scriptArgs scriptArgIndex |
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
	 
	scriptPath := scriptFile asFileReference.
	^ self new 
		scriptPath: scriptPath;
		scriptArgs: scriptArgs;
		parseAndExecuteScriptFile: scriptPath;
		yourself
]

{ #category : 'commands' }
SuperDoitCommandParser >> classMethod: aString className: className [
	^ SuperDoitExtensionMethodCommand
		chunk: aString
		className: className
		isMeta: true
]

{ #category : 'accessing' }
SuperDoitCommandParser >> commandDefinition [
	^ commandDefinition
		ifNil: [ commandDefinition := SuperDoitCommandDefinition new ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> doit: aString [
	^ SuperDoitDoitCommand chunk: aString
]

{ #category : 'accessing' }
SuperDoitCommandParser >> done [
^ done ifNil: [ false ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> input: aString [
	^ SuperDoitInputCommand chunk: aString
]

{ #category : 'accessing' }
SuperDoitCommandParser >> instVarNames [
	^ instVarNames ifNil: [ instVarNames := {} ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> instVarNames: anArray [
	instVarNames := anArray
]

{ #category : 'commands' }
SuperDoitCommandParser >> instVarNamesCommand: string [
	^ SuperDoitInstVarNamesCommand chunk: string
]

{ #category : 'commands' }
SuperDoitCommandParser >> method: aString [
	^ SuperDoitMethodCommand chunk: aString
]

{ #category : 'commands' }
SuperDoitCommandParser >> method: aString className: className [
	^ SuperDoitExtensionMethodCommand chunk: aString className: className
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

{ #category : 'commands' }
SuperDoitCommandParser >> options: string [
	^ SuperDoitOptionsCommand chunk: string
]

{ #category : 'accessing' }
SuperDoitCommandParser >> optionSpecs [
	^ optionSpecs ifNil: [ optionSpecs := Dictionary new ]
]

{ #category : 'execution' }
SuperDoitCommandParser >> parseAndExecuteScriptFile: scriptFileReference [
	scriptFileReference
		readStreamDo: [ :fStream | 
			stream := ZnBufferedReadStream on: fStream.
			[ self done ]
				whileFalse: [ 
					self processNextCommand
						ifNotNil: [ :command | self commandDefinition addCommand: command ] ].
			self commandDefinition executeAgainst: self.
			^ doitResult ]
]

{ #category : 'parsing' }
SuperDoitCommandParser >> processNextCommand [
	| line words command commandSelector |
	stream atEnd
		ifTrue: [ 
			done := true.
			^ nil ].
	line := stream nextLine trimSeparators.
	words := line subStrings.
	words isEmpty
		ifTrue: [ ^ nil ].

	command := words first asUppercase.
	(command at: 1) == $# 
		ifTrue: [ ^ self scriptComment: line ].
	command = 'DOIT'
		ifTrue: [ ^ self doit: self nextChunk ].
	command = 'METHOD'
		ifTrue: [ ^ self method: self nextChunk  ].
	command = 'METHOD:'
		ifTrue: [  ^ self method: self nextChunk className: (words at: 2) ].
	command = 'CLASSMETHOD:'
		ifTrue: [ ^ self classMethod: self nextChunk className: (words at: 2) ].
	command = 'INPUT'
		ifTrue: [ ^ self input: self nextChunk ].
	command = 'OPTIONS'
		ifTrue: [ ^ self options: self nextChunk ].
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
]

{ #category : 'accessing' }
SuperDoitCommandParser >> projectsHome [
	^ projectsHome ifNil: [ 'ROWAN_PROJECTS_HOME' ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> projectsHome: aString [
	projectsHome := aString
]

{ #category : 'commands' }
SuperDoitCommandParser >> projectsHomeCommand: string [
	^ SuperDoitProjectsHomeCommand chunk: string
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptArgs [
^ scriptArgs ifNil: [ #() ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptArgs: aColl [
 scriptArgs := aColl
]

{ #category : 'commands' }
SuperDoitCommandParser >> scriptComment: aString [
	^ SuperDoitScriptCommentCommand chunk: aString
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptPath [
	^ scriptPath
]

{ #category : 'accessing' }
SuperDoitCommandParser >> scriptPath: aFileReference [
	scriptPath := aFileReference
]

{ #category : 'accessing' }
SuperDoitCommandParser >> specs [
	^ specs ifNil: [ specs := {} ]
]

{ #category : 'commands' }
SuperDoitCommandParser >> specsCommand: string [
	^ SuperDoitSpecsCommand chunk: string
]

{ #category : 'commands' }
SuperDoitCommandParser >> specUrls: string [
	^ SuperDoitSpecUrlsCommand chunk: string
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
	"install the script class in a symbol dictionary in the transient symbol list ... 
		we do not want the class persisted"

	^ systemDictionary
		ifNil: [ 
			| sess symbolList name |
			sess := GsCurrentSession currentSession.
			sess _transientSymbolList ifNil: [ System refreshTransientSymbolList ].
			symbolList := sess transientSymbolList.
			name := #'superDoitSymbolDict'.
			^ systemDictionary := (symbolList resolveSymbol: name)
				ifNil: [ 
					systemDictionary := SymbolDictionary new name: name.
					symbolList insertObject: systemDictionary at: 1 ] ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> usage [
	^ usage ifNil: [ ^ 'NO HELP' ]
]

{ #category : 'accessing' }
SuperDoitCommandParser >> usage: string [
	"any env var refs in string should be substituted upon display"
	usage := string
]

{ #category : 'commands' }
SuperDoitCommandParser >> usageCommand: string [
	^ SuperDoitUsageCommand chunk: string
]
