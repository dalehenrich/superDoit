persist
persist
	"Arrange to add the transient symbol dictionary to the peristent symbol list, so that 
		the script can be edited in a class browser."

	"Use export to rewrite the script file after editing"

	| transientSymbolDictionaryAssoc |
	transientSymbolDictionaryAssoc := GsCurrentSession currentSession symbolList
		resolveSymbol:
			self class commandParserInstance class transientSymbolDictionaryName.
	System myUserProfile symbolList
		add: transientSymbolDictionaryAssoc value
		before: UserGlobals.
	self stdout
		nextPutAll: 'saved ' , transientSymbolDictionaryAssoc key printString;
		lf.
	^ System commit