*superdoit-core31-5
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
