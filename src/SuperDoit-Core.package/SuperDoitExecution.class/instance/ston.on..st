private
ston: anObject on: aStream
	| ston |
	ston := SuperDoitExecution globalNamed: #'STON'.
	(ston notNil and: [ GsFile respondsTo: #'print:' ])
		ifTrue: [ ston put: anObject onStreamPretty: aStream ]
		ifFalse: [ 
			"if STON is not present or GsFile>>print: not implemented, then our best bet is to print the object"
			aStream
				nextPutAll: anObject printString;
				lf ]