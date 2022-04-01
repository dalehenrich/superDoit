accessing
superDoitExecutionMetadataClass
	^ superDoitExecutionMetadataClass
		ifNil: [ 
			superDoitExecutionMetadataClass := SuperDoitExecution
				subclass: 'SuperDoitExecutionMetadataClass'
				instVarNames: #()
				classVars: #('ExecutionInstance' 'CommandParserInstance')
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary.
			superDoitExecutionMetadataClass class
				compileMethod: 'executionInstance: anObject ExecutionInstance := anObject'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod: 'executionInstance ^ ExecutionInstance'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod:
						'commandParserInstance: anObject CommandParserInstance := anObject'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				compileMethod: 'commandParserInstance ^ CommandParserInstance'
					dictionaries: GsCurrentSession currentSession symbolList
					category: 'execution';
				yourself.
			superDoitExecutionMetadataClass ]