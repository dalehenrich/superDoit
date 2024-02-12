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
			gotEx := ex.
			(ex isKindOf: ExitClientError)
				ifTrue: [ 
					"honor exit client request"
					ex return. "allow ensure blocks to run"
					ex pass ].
			interactive := self _printStackOnDebugError not.
			haveDebugGem := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			haveDebug := ((self respondsTo: #'debugGem') and: [ self debugGem ])
				or: [ (self respondsTo: #'debug') and: [ self debug ] ].
			haveDebugGem
				ifFalse: [ 
					((self respondsTo: #'debugGem') and: [ self debugGem ])
						ifTrue: [ haveDebugGem := true ] ].
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
						ifTrue: [ System waitForDebug ] ].
			ex return "allow ensure blocks to run" ].
	gotEx 
		ifNotNil: [
			"exit script on with non-zero exit status ... use description to provide a user friendly error message"
			self exit: gotEx description withStatus: 1	"does not return" ].
	^ res
