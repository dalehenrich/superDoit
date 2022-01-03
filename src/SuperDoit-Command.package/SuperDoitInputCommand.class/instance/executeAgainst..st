execution
executeAgainst: aCommandParser

	| inputFileStream |
	inputFileStream := ReadStreamPortable on: self chunk.
	[ inputFileStream atEnd ]
		whileFalse: [ 
			| filePath |
			filePath := inputFileStream nextLine.
			GsFileIn fromServerPath: filePath ]