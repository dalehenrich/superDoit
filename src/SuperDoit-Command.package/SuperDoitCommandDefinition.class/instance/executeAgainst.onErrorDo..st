execution
executeAgainst: aCommandParser onErrorDo: errorBlock
	self commands
		do: [ :command | command executeAgainst: aCommandParser onErrorDo: errorBlock ]