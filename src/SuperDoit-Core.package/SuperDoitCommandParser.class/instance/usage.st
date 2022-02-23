accessing
usage
	"trimRight so that solo script don't have trailing whitespace in EXAMPLES "

	^ usage
		ifNil: [ 
			| stoneArgs stoneName |
			SuperDoitExecution isSolo
				ifTrue: [ stoneName := stoneArgs := '' ]
				ifFalse: [ 
					stoneName := '-- gs_360'.
					stoneArgs := ' [-- [<stone-name> [<topaz-command-line-args>] ] ]' ].
			^ '-----
USAGE $basename [--help | -h] [--debug | -D]' , stoneArgs
				,
					'

OPTIONS
  -h, --help                 display usage message
  -D, --debug                bring up topaz debugger in the event of a script error

EXAMPLES
  $basename --help' , ('  ' , stoneName) trimRight
				,
					'
  $basename -h' , ('      ' , stoneName) trimRight
				,
					'
  $basename --debug' , (' ' , stoneName) trimRight
				,
					'
  $basename -D' , ('      ' , stoneName) trimRight
				,
					'
  $basename' , ('         ' , stoneName) trimRight
				,
					'
-----
' ]