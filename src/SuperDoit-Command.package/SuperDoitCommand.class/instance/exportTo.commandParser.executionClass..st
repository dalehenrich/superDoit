exporting
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	writeStream
		nextPutAll: self commandString;
		lf;
		nextPutAll: self chunk;	"chunk has a trailing lf"
		nextPutAll: '%';
		lf