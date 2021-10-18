accessing
superDoitExecutionClass
	^ superDoitExecutionClass
		ifNil: [ 
			superDoitExecutionClass := SuperDoitExecution
				subclass: 'SuperDoitExecutionClass'
				instVarNames: self instVarNames
				classVars: #('ExecutionInstance' 'CommandParserInstance')
				classInstVars: #()
				poolDictionaries: #()
				inDictionary: self systemDictionary.
			superDoitExecutionClass class
				compileMethod: 'executionInstance: anObject ExecutionInstance := anObject';
				compileMethod: 'executionInstance ^ ExecutionInstance';
				compileMethod:
						'commandParserInstance: anObject CommandParserInstance := anObject';
				compileMethod: 'commandParserInstance ^ CommandParserInstance';
				yourself.
			superDoitExecutionClass ]