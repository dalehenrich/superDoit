*superdoit-core36x
doit
	"standard option handling ... for customization override in script"

	[ 
	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit ]
		on: Error , Halt , TestFailure
		do: [ :ex | 
			| haveDebug interactive |
			(ex isKindOf: ExitClientError)
				ifTrue: [ 
					"honor exit client request"
					ex pass ].
			interactive := self _printStackOnDebugError not.
			haveDebug := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			haveDebug
				ifFalse: [ 
					((self respondsTo: #'debugGem') and: [ self debugGem ])
						ifTrue: [ 
							interactive
								ifFalse: [ 
									self stdout
										nextPutAll: System listenForDebugConnection asString;
										lf ].
							haveDebug := true ] ].
			interactive
				ifTrue: [ ex pass ]
				ifFalse: [ 
					self stdout
						nextPutAll: '---------------------';
						lf;
						nextPutAll: 'Unhandled Error in script: ' , self scriptPath;
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: ex description;
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: (GsProcess stackReportToLevel: 300);
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: 'GsProcess @' , GsProcess _current asOop printString;
						lf.
					haveDebug
						ifTrue: [ 
							self stdout
								nextPutAll:
										'Waiting for topaz to attach: DEBUGGEM ' , System gemProcessId asString , ' '
												, System listenForDebugConnection asString;
								lf;
								flush.
							[ true ] whileTrue: [ Delay waitForSeconds: 1 ] ].
					self exit: ex description withStatus: 1	"does not return" ] ]