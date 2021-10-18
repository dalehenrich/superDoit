accessing
superDoitExecutionClass
	^ superDoitExecutionClass
		ifNil: [ 
			superDoitExecutionClass := self superDoitExecutionMetadataClass
				subclass: 'SuperDoitExecutionClass'
				instVarNames: self instVarNames
				classVars: #()
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary ]