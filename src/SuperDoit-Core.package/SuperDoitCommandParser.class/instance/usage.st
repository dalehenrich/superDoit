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
USAGE $basename [--help | -h] [--debug | -D] [--debugGem]' , stoneArgs
				,
					'

OPTIONS
  -h, --help      display usage message
  -D, --debug     bring up topaz debugger in the event of a script error
  --debugGem      If terminal is connected to stdout, bring up debugger. If not,
                  dump stack to stdout and wait for topaz to attach using topaz
                  DEBUGGEM command.

EXAMPLES
  $basename --help' , ('  ' , stoneName) trimRight
				,
					'
  $basename -h' , ('      ' , stoneName) trimRight
				,
					'
  $basename -D' , ('      ' , stoneName) trimRight
				,
					'
  $basename --debugGem' , ('      ' , stoneName) trimRight
				,
					'
  $basename' , ('         ' , stoneName) trimRight
				,
					'
-----
' ]