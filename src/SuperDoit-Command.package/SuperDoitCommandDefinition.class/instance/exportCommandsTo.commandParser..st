export
exportCommandsTo: scriptFileRef commandParser: commandParser
	scriptFileRef
		writeStreamDo: [ :writeStream | 
			self commands
				do: [ :command | command exportTo: writeStream commandParser: commandParser ] ]