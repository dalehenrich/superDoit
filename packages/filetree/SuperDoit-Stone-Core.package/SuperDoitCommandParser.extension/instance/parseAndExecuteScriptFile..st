*superdoit-stone-core
parseAndExecuteScriptFile: scriptFilePath
	stream := FileStream fileNamed: scriptFilePath.
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
	self commandDefinition executeAgainst: self.
	^ doitResult ]
		ensure: [ stream close ]