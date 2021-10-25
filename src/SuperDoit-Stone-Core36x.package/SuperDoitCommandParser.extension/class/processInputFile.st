*superdoit-stone-core36x
processInputFile
	"command line looks like the following:
		<path-to-topaz>/topaz <topaz arguments> -- <script-file-path> -- <script-args>
	"

	| args scriptArgStart argIndex scriptFile scriptArgs scriptArgIndex |
	args := System commandLineArguments.
	scriptArgStart := args indexOf: '--'.
	argIndex := scriptArgStart + 1.	"arg after initial --"
	(scriptArgStart <= 0 or: [ argIndex > args size ])
		ifTrue: [ self error: 'input file is expected to be specified on the command line' ].
	scriptFile := GsFile serverRealPath: (args at: argIndex).
	scriptArgIndex := args indexOf: '--' startingAt: argIndex + 1.
	scriptArgs := scriptArgIndex = 0
		ifTrue: [ #() ]
		ifFalse: [ args copyFrom: scriptArgIndex + 1 to: args size ].

	^ self new
		scriptPath: scriptFile;
		scriptArgs: scriptArgs;
		parseAndExecuteScriptFile: scriptFile;
		yourself
