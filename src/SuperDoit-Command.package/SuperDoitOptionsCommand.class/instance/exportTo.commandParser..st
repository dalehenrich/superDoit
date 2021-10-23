exporting
exportTo: writeStream commandParser: commandParser
	"The first command in the list is always an option command ... normally empty, unless it is a custom options command"

	(super optionSpecs: commandParser) isEmpty
		ifFalse: [ super exportTo: writeStream commandParser: commandParser ]