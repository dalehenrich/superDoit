export
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