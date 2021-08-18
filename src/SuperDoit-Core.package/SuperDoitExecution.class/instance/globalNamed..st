accessing
globalNamed: aString
	^ self class
		globalNamed: aString
		ifAbsent: [ self error: 'The global named ' , aString printString , ' was not found.' ]