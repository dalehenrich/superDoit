private
_string: aString beginsWith: prefix
	"in-place implmentation of beginsWith: ... 3.4.5 and older don't implement beginsWith: "

	(prefix isEmpty or: [ aString size < prefix size ])
		ifTrue: [ ^ false ]
		ifFalse: [ 
			1 to: prefix size do: [ :index | 
				(aString at: index) ~= (prefix at: index)
					ifTrue: [ ^ false ] ] ].
	^ true