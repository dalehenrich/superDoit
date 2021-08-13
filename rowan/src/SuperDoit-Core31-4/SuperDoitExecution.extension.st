Extension { #name : 'SuperDoitExecution' }

{ #category : '*superdoit-core31-4' }
SuperDoitExecution >> doit [
	"standard option handling ... for customization override in script"

	"
		Without the -S option, we have to use `output push /dev/null only` to 
		suppress the echoing of topaz commands used to implement superdoit, however,
		when there is an error, we need to dump the error message to stdout and 
		prompt the user to exit or do `output pop` to debug
	"

	[ 
	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit ]
		on: Error
		do: [ :ex | 
			((self respondsTo: #'debug') and: [ self debug ])
				ifTrue: [ 
					self stdout 
						nextPutAll: 'Error occurred while executing script. To debug, use the following topaz commands:'; lf;
						tab; nextPutAll: 'output pop'; lf;
						tab; nextPutAll: 'where'; lf;
						yourself.
					ex pass ].
			self exit: ex messageText withStatus: 1	"does not return" ]
]

{ #category : '*superdoit-core31-4' }
SuperDoitExecution class >> isSolo [
	^ false
]
