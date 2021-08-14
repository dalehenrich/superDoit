*superdoit-core31-5
systemDictionary
	"install the script class in a symbol dictionary in the transient symbol list ... 
		we do not want the class persisted"

	^ systemDictionary
		ifNil: [ 
			| sess symbolList name |
			sess := GsCurrentSession currentSession.
			symbolList := sess symbolList.	"transient symbol list"
			name := self class transientSymbolDictionaryName.
			^ systemDictionary := (symbolList resolveSymbol: name)
				ifNotNil: [ :assoc | assoc value ]
				ifNil: [ 
					systemDictionary := SymbolDictionary new name: name.
					symbolList insertObject: systemDictionary at: 1 ] ]