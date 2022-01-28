*superdoit-core36x
doit
	"standard option handling ... for customization override in script"

	[ 
	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit ]
		on: Error , Halt
		do: [ :ex | 
			| listenForDebug |
			(ex isKindOf: ExitClientError)
				ifTrue: [ 
					"honor exit client request"
					ex pass ].
			listenForDebug := (System gemConfigurationAt: 'GEM_LISTEN_FOR_DEBUG') == true.
			(listenForDebug or: [ self _printStackOnDebugError ])
				ifTrue: [ 
					"when --debug option is set and stdout is not a terminal (i.e., cannot 
						use topaz as interactive debugger), unconditionally print stack to 
						stdout and exit"
					GsFile
						gciLogServer: '---------------------';
						gciLogServer: 'Unhandled Error in script: ' , self scriptPath;
						gciLogServer: '---------------------';
						gciLogServer: ex description;
						gciLogServer: '---------------------';
						gciLogServer: (GsProcess stackReportToLevel: 300);
						gciLogServer: '---------------------';
						gciLogServer: 'GsProcess @' , GsProcess _current asOop printString;
						gciLogServer: '---------------------' ].
			(listenForDebug or: [ (self respondsTo: #'debug') and: [ self debug ] ])
				ifTrue: [ ex pass ].
			self exit: ex description withStatus: 1	"does not return" ]