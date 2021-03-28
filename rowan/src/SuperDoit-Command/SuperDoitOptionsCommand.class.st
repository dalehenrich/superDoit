Class {
	#name : 'SuperDoitOptionsCommand',
	#superclass : 'SuperDoitCustomOptionsCommand',
	#category : 'SuperDoit-Command'
}

{ #category : 'accessing' }
SuperDoitOptionsCommand >> optionSpecs: aCommandParser [
	^ aCommandParser standardOptionSpecs , (super optionSpecs: aCommandParser)
]
