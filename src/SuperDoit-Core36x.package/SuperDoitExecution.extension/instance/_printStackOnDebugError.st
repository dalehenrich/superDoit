*superdoit-core36x
_printStackOnDebugError
	"when --debug option is set and stdout is not a terminal 
		(i.e., cannot use topaz as interactive debugger), 
		unconditionally print stack to stdout and exit"

	"To change default behavior, override in script"

	^ self class _stdoutIsNotTerminal