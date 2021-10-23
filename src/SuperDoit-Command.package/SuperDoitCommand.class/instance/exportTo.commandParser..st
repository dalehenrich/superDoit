exporting
exportTo: writeStream commandParser: commandParser
	writeStream
		nextPutAll: self commandString;
		lf;
		nextPutAll: self chunk; "chunk has a trailing lf"
		nextPutAll: '%';
		lf