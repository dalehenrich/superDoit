*superdoit-stone-core
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
			"this block is intended to handle any errors that result in the execution of commands ... errors during doit command are expected to be excluded"
			SuperDoitExecution _stdoutIsTerminal
				ifTrue: [ 
					"stdout is not a Terminal, so need to dump stack in the event of an error"
					GsFile
						gciLogServer: '---------------------';
						gciLogServer: error description;
						gciLogServer: '---------------------';
						gciLogServer: (GsProcess stackReportToLevel: 300);
						gciLogServer: '---------------------' ].
			error pass ].
	^ doitResult ]
		ensure: [ self stream close ]