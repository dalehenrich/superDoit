Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-core36x' }
SuperDoitExecution >> exit: message withStatus: statusInteger [
	"Does not return and terminates the os process with exit status <statusInteger>"

	self logErrorMessage: message.
	ExitClientError signal: 'explicit process exit' status: statusInteger
]

{ #category : '*superdoit-core36x' }
SuperDoitExecution >> exitWithStatus: statusInteger [
	"Does not return and terminates the os process with exit status <statusInteger>"

	ExitClientError signal: 'explicit process exit' status: statusInteger
]
