execution
executeAgainst: aCommandParser onErrorDo: errorBlock
	[ self executeAgainst: aCommandParser ]
		on: Error
		do: errorBlock