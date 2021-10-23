exporting
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	writeStream
		nextPutAll: self chunk;
		lf