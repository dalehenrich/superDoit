execution
executeAgainst: aCommandParser onErrorDo: errorBlock
	"errors during execution of doit are under script control"

	self executeAgainst: aCommandParser