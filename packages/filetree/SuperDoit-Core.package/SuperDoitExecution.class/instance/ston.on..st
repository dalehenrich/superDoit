private
ston: anObject on: aStream
	(SuperDoitExecution globalNamed: #'STON')
		ifNotNil: [ :ston | ston put: anObject onStreamPretty: aStream ]
		ifNil: [ 
			"if STON is not present, then our best bet is to print the object"
			aStream
				nextPutAll: anObject printString;
				lf ]