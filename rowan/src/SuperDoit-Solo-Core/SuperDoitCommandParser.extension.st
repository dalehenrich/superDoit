Extension { #name : 'SuperDoitCommandParser' }

{ #category : '*superdoit-solo-core' }
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

{ #category : '*superdoit-solo-core' }
SuperDoitCommandParser >> parseAndExecuteScriptFile: scriptFileReference [
	scriptFileReference
		readStreamDo: [ :fStream | 
			stream := ZnBufferedReadStream on: fStream.
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
			self commandDefinition executeAgainst: self.
			^ doitResult ]
]

{ #category : '*superdoit-solo-core' }
SuperDoitCommandParser >> scriptPath: aFileReference [
	scriptPath := aFileReference
]
