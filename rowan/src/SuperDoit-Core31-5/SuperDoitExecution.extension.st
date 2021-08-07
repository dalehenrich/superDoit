Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-core31-5' }
SuperDoitExecution >> exit: message withStatus: statusInteger [
	"exiting image with an exit status not supported until 3.6.0"

	self logErrorMessage: message.
	System logout
]

{ #category : '*superdoit-core31-5' }
SuperDoitExecution >> exitWithStatus: statusInteger [
	"exiting image with an exit status not supported until 3.6.0"

	System logout
]
