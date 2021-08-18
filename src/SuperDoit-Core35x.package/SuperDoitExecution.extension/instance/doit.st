*superdoit-core35x
doit
	"standard option handling ... for customization override in script"

	"no special error handling ... with topaz -S option, exiting topaz with an
		error message is not feasible, so we'll just stay in permanent debug mode"

	self getAndVerifyOptions == self noResult
		ifTrue: [ ^ self noResult ].
	^ self theDoit