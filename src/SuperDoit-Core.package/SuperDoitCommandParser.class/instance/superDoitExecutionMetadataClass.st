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
					category: 'execution';
				compileMethod: 'executionInstance ^ ExecutionInstance'
					category: 'execution';
				compileMethod:
						'commandParserInstance: anObject CommandParserInstance := anObject'
					category: 'execution';
				compileMethod: 'commandParserInstance ^ CommandParserInstance'
					category: 'execution';
				yourself.
			superDoitExecutionMetadataClass ]