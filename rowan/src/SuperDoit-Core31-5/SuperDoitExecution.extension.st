Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-core31-5' }
SuperDoitExecution >> doit [
	"standard option handling ... for customization override in script"

	"no special error handling ... with topaz -S option, exiting topaz with an
		error message is not feasible, so we'll just stay in permanent debug mode"

	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit
]

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
