logging
displayResult: anObject
	anObject ~~ self noResult
		ifTrue: [ 
			| stdout |
			stdout := self stdout.
			(stdout respondsTo: #'print:')
				ifTrue: [ self ston: anObject on: stdout ]
				ifFalse: [ 
					| strm |
					"workaround for https://github.com/dalehenrich/superDoit/issues/18"
					strm := WriteStream on: String new.
					self ston: anObject on: strm.
					self stdout nextPutAll: strm contents ].
		stdout lf]
