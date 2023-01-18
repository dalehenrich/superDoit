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
  --debugGem      If terminal is connected to stdout, behaves exactly like --debug.
                  If terminal is not connected to stdout (i.e., non-interactive
                  session), System class listenForDebugConnection is called, a
                  stack is written to "stdout" and the session waits in an infinite
                  loop until another topaz session attaches using the topaz 
                  DEBUGGEM command. NOTE --debugGem should not be used with 
                  GemStone older than 3.6.x.
EXAMPLES
  $basename --help' , ('  ' , stoneName) trimRight
				,
					'
  $basename -h' , ('      ' , stoneName) trimRight
				,
					'
  $basename --debugGem' , (' ' , stoneName) trimRight
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