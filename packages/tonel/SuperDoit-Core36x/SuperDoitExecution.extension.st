Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-core36x' }
SuperDoitExecution >> doit [
	"standard option handling ... for customization override in script"

	[ 
	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit ]
		on: Error
		do: [ :ex | 
			((self respondsTo: #'debug') and: [ self debug ])
				ifTrue: [ ex pass ].
			self exit: ex messageText withStatus: 1	"does not return" ]
]

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
