accessing
longName: aString
	aString isValidIdentifier
		ifFalse: [ 
			self
				error:
					aString printString
						,
							' is an invalid long option name. Long option names are constrained to be a valid selector.' ].
	longName := aString