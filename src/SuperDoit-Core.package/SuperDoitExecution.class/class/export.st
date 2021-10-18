export
export
	"export the 'persist'ed class to disk, writing in canonical format. New instance 
		variables will be added to instvar command and all instance-side methods in 
		reciever will be written out to the superdoit script file along with the original 
		non-method commands"

	| commandParser executionInstance scriptFileRef |
	self name == #'SuperDoitExecutionClass'
		ifFalse: [ 
			self
				error:
					'export should only be performed on the SuperDoitExecutionClass class' ].
	commandParser := self commandParserInstance.
	executionInstance := self executionInstance.
	scriptFileRef := executionInstance scriptPath asFileReference.
	scriptFileRef exists
		ifFalse: [ self halt ].
	self selectors asArray sort do: [ :sel | self halt ]
