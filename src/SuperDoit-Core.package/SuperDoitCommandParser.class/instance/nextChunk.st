parsing
nextChunk
	| str line strm |
	str := String new.
	strm := self stream.
	[ strm atEnd not ]
		whileTrue: [ 
			line := strm nextLine trimTrailingSeparators.
			(line notEmpty and: [ line first = $% ])
				ifTrue: [ ^ str ].
			str
				addAll: line;
				lf ].
	self error: 'ran off end of file!'