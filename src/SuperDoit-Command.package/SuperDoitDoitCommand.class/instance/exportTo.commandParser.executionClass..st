exporting
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	"METHOD commands have been ignored on export. The instance side methods for executionClass will be exported in canonical order before the DOIT command"

	(executionClass selectors
		sort: [ :a :b | 
			"use Unicode sort order because private methods (leading $_) sort first"
			a _unicodeLessThan: b ])
		do: [ :sel | 
			| methodSource |
			methodSource := (executionClass compiledMethodAt: sel) sourceString.
			writeStream
				nextPutAll: 'method';
				lf;
				nextPutAll: methodSource.
			methodSource last == Character lf
				ifFalse: [ writeStream lf ].
			writeStream
				nextPutAll: '%';
				lf ].
	super
		exportTo: writeStream
		commandParser: commandParser
		executionClass: executionClass