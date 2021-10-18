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
				compileMethod: 'executionInstance: anObject ExecutionInstance := anObject';
				compileMethod: 'executionInstance ^ ExecutionInstance';
				compileMethod:
						'commandParserInstance: anObject CommandParserInstance := anObject';
				compileMethod: 'commandParserInstance ^ CommandParserInstance';
				yourself.
			superDoitExecutionMetadataClass ]