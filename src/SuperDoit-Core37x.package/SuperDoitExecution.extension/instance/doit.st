*superdoit-core37x
doit
	"standard option handling ... for customization override in script"
	| res gotEx |
	res := [ 
		self getAndVerifyOptions == self noResult ifTrue: [  self noResult ]
			ifFalse:[  self theDoit ]
	]
		on: Error , Halt , TestFailure
		do: [ :ex | 
			| haveDebugGem interactive haveDebug |
			(ex isKindOf: ExitClientError)
				ifTrue: [ 
					"honor exit client request"
					gotEx := ex .
					ex return ].
			interactive := self _printStackOnDebugError not.
			haveDebugGem := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			haveDebug := ((self respondsTo: #'debugGem') and: [ self debugGem ])
				or: [ (self respondsTo: #'debug') and: [ self debug ] ].
			haveDebugGem
				ifFalse: [ 
					((self respondsTo: #'debugGem') and: [ self debugGem ])
						ifTrue: [ 
							interactive
								ifFalse: [ 
									self stdout
										nextPutAll: System listenForDebugConnection asString;
										lf ].
							haveDebugGem := true ] ].
			interactive
				ifTrue: [ 
					haveDebug
						ifTrue: [ ex pass ] ]
				ifFalse: [ 
					self stdout
						nextPutAll: '---------------------';
						lf;
						nextPutAll: 'Unhandled Error in script: ' , self scriptPath;
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: ex printString;
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: (GsProcess stackReportToLevel: 300);
						lf;
						nextPutAll: '---------------------';
						lf;
						nextPutAll: 'GsProcess @' , GsProcess _current asOop printString;
						lf.
					haveDebugGem
						ifTrue: [ 
							self stdout
								nextPutAll:
										'Waiting for topaz to attach: DEBUGGEM ' , System gemProcessId asString , ' '
												, System listenForDebugConnection asString;
								lf;
								flush.
							System waitForDebug ] ].
			gotEx := ex.
			ex return ].
	gotEx ifNotNil: [ self exit: gotEx printString withStatus: 1	"does not return" ].
	^ res
