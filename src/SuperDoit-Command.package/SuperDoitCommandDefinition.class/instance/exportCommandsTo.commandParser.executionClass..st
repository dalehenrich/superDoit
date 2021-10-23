export
exportCommandsTo: scriptFileRef commandParser: commandParser executionClass: executionClass
	scriptFileRef
		writeStreamDo: [ :writeStream | 
			self commands
				do: [ :command | 
					command
						exportTo: writeStream
						commandParser: commandParser
						executionClass: executionClass ] ]