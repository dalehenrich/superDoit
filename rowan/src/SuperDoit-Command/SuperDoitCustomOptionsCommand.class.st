Class {
	#name : 'SuperDoitCustomOptionsCommand',
	#superclass : 'SuperDoitCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'execution' }
SuperDoitCustomOptionsCommand >> executeAgainst: aCommandParser [
	| ivNames optionSpecs optionsDict |
	ivNames := aCommandParser instVarNames.
	optionSpecs := self optionSpecs: aCommandParser.
	optionsDict := Dictionary new.
	optionSpecs do: [ :spec | optionsDict at: spec longName put: spec ].
	aCommandParser optionsDict: optionsDict.
	optionSpecs
		do: [ :option | 
			| longName |
			longName := option longName.
			self
				compileMethod:
					longName , '  ^ (self optionsDict at: ' , longName printString , ') value'
				for: aCommandParser superDoitExecutionClass.

			self
				compileMethod:
					longName , ': optionValue (self optionsDict at:' , longName printString
						, ') value: optionValue'
				for: aCommandParser superDoitExecutionClass ]
]

{ #category : 'accessing' }
SuperDoitCustomOptionsCommand >> optionSpecs: aCommandParser [
	| ar |
	ar := self chunk evaluate.
	ar _isArray
		ifFalse: [ self error: 'Expected an Array of options: ' , ar printString ].
	^ ar
]
