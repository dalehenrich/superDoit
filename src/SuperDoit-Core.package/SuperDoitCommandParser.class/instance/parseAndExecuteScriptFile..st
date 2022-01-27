parsing
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
			| listenForDebug |
			"this block is intended to handle any errors that result in the execution of commands ... errors during doit command are expected to be handled elsewhere"
			listenForDebug := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			(SuperDoitExecution _stdoutIsNotTerminal or: [ listenForDebug ])
				ifTrue: [ 
					"stdout is not a Terminal, so need to dump stack in the event of an error"
					GsFile
						gciLogServer: '---------------------';
						gciLogServer: 'Unhandled Error in script: ' , scriptFilePath;
						gciLogServer: '---------------------';
						gciLogServer: error description;
						gciLogServer: '---------------------';
						gciLogServer: (GsProcess stackReportToLevel: 300);
						gciLogServer: '---------------------';
						gciLogServer: 'GsProcess @' , GsProcess _current asOop printString;
						gciLogServer: '---------------------'.
					listenForDebug
						ifTrue: [ error pass ].
					(SuperDoitExecution globalNamed: 'ExitClientError')
						ifNotNil: [ :class | 
							"3.6.x and beyond"
							GsFile stderr
								nextPutAll: error description;
								lf.
							class signal: error description status: 1	"does not return" ] ].
			error pass ].
	^ doitResult ]
		ensure: [ self stream close ]