Class {
	#name : 'SuperDoitDoitCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitDoitCommand >> executeAgainst: aCommandParser [
	| instance |
	self
		compileMethod:
			'theDoit ^ ' , self chunk printString , ' evaluateInContext: self symbolList: '
				, self symbolListExpressionString
		for: aCommandParser superDoitExecutionClass.
	instance := aCommandParser superDoitExecutionClass new.
	instance scriptPath: aCommandParser scriptPath.
	instance scriptArgs: aCommandParser scriptArgs.
	instance usage: aCommandParser usage.
	instance optionsDict: aCommandParser optionsDict.
	instance processDynamicSections: aCommandParser.
	instance _loadSpecs: aCommandParser specs.
	instance displayResult: instance doit
]
