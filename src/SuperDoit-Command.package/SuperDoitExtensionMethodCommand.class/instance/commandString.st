accessing
commandString
	^ self isMeta
		ifTrue: [ 'classmethod: ' , self className ]
		ifFalse: [ 'method: ' , self className ]