exporting
exportTo: writeStream commandParser: commandParser
	writeStream
		nextPutAll: self chunk;
		lf