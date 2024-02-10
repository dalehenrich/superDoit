doit
(Object
	subclass: 'SuperDoitTestArgsData'
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: UserGlobals
	options: #( )
)
		immediateInvariant.
true.
%
classMethod: SuperDoitTestArgsData
testArgsArray
	| gs37 |
	gs37 := (System gemVersionReport at: 'gsVersion') beginsWith: '3.7'.
	^ {
		'123 -m must' -> (Dictionary new
			at: 'args' 
				put: { '123' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-m must 123 456' -> (Dictionary new
			at: 'args' 
				put: { '123' . '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'must' put: 'must';
						yourself);
			yourself).
		'456 -m must 123' -> (Dictionary new
			at: 'args' 
				put: { '456' .'123' };
			at: 'options'
								put: 
					(Dictionary new
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--required=123 -m must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'required' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--required=123 456 --must=must' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'required' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'456 --required=123 --must=must' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'required' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
  	'456 --required=789 12 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' . '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--another=123 -m must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--another=123 456 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'456 --another=123 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).

		'--none -m must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-n -m must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-n 456 --required=789 12 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' . '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -n --required=789 12' -> (Dictionary new
			at: 'args' 
				put: { '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -na 456 --required=789 12' -> (Dictionary new
			at: 'args' 
				put: { '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'another' put: '456';
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -a 123 -n 789' -> (Dictionary new
			at: 'args' 
				put: { '789' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -nDa 123 456' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'debug' put: true;
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).

		'--must=must --required=123 -a 789 -n' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '123';
						at: 'another' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must --required=123 --another=789 --none' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '123';
						at: 'another' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).

		gs37
			ifTrue: [ '--another=123' -> 'a UserDefinedError occurred (error 2318), reason:halt, The required option ''must'' was not set.' ]
			ifFalse: ['--another=123' -> 'UserDefinedError: The required option ''must'' was not set.' ].
		gs37
			ifTrue: [ '--must=must -a 123 --another=123' -> 'a UserDefinedError occurred (error 2318), reason:halt, The option ''another'' has already been processed.' ]
			ifFalse: [ '--must=must -a 123 --another=123' -> 'UserDefinedError: The option ''another'' has already been processed.' ] .
		gs37
			ifTrue: [ '--must=must -n --none' -> 'a UserDefinedError occurred (error 2318), reason:halt, The option ''none'' has already been processed.']
			ifFalse: [ '--must=must -n --none' -> 'UserDefinedError: The option ''none'' has already been processed.'].
		gs37
			ifTrue: [ '--must=must -n -n' -> 'a UserDefinedError occurred (error 2318), reason:halt, The option ''none'' has already been processed.' ]
			ifFalse: [ '--must=must -n -n' -> 'UserDefinedError: The option ''none'' has already been processed.' ].
		gs37
			ifTrue: [ '--must=must -a 123 --another=456' -> 'a UserDefinedError occurred (error 2318), reason:halt, The option ''another'' has already been processed.' ]
			ifFalse: [ '--must=must -a 123 --another=456' -> 'UserDefinedError: The option ''another'' has already been processed.' ].
		gs37
			ifTrue: [ '-m must -a --noshort' -> 'a UserDefinedError occurred (error 2318), reason:halt, Missing required argument for option ''another'' [a]' ]
			ifFalse: [ '-m must -a --noshort' -> 'UserDefinedError: Missing required argument for option ''another'' [a]' ].
		gs37
			ifTrue: [ '-m must --another' -> 'a UserDefinedError occurred (error 2318), reason:halt, Missing required argument for option ''another'' [b]' ]
			ifFalse: [ '-m must --another' -> 'UserDefinedError: Missing required argument for option ''another'' [b]' ].
		gs37
			ifTrue: [ '-m must -an' -> 'a UserDefinedError occurred (error 2318), reason:halt, Missing required argument for option ''another'' [c]' ]
			ifFalse: [ '-m must -an' -> 'UserDefinedError: Missing required argument for option ''another'' [c]' ].
		gs37
			ifTrue: [ '-m must -a' -> 'a UserDefinedError occurred (error 2318), reason:halt, Missing required argument for option ''another'' [d]' ]
			ifFalse: [ '-m must -a' -> 'UserDefinedError: Missing required argument for option ''another'' [d]' ].
		gs37
			ifTrue: [ '-a' -> 'a UserDefinedError occurred (error 2318), reason:halt, Missing required argument for option ''another'' [d]' ]
			ifFalse: [ '-a' -> 'UserDefinedError: Missing required argument for option ''another'' [d]' ].
		gs37
			ifTrue: [ '-' -> 'a UserDefinedError occurred (error 2318), reason:halt, Cannot handle naked dashes ''-''' ]
			ifFalse: [ '-' -> 'UserDefinedError: Cannot handle naked dashes ''-''' ].
		gs37
			ifTrue: [ '--unknown=something' -> 'a UserDefinedError occurred (error 2318), reason:halt, Unknown option ''unknown'' [a]' ]
			ifFalse: [ '--unknown=something' -> 'UserDefinedError: Unknown option ''unknown'' [a]' ].
		gs37
			ifTrue: [  '--unknown' -> 'a UserDefinedError occurred (error 2318), reason:halt, Unknown option ''unknown'' [b]' ]
			ifFalse: [ '--unknown' -> 'UserDefinedError: Unknown option ''unknown'' [b]' ].
		gs37
			ifTrue: [ '-x something' -> 'a UserDefinedError occurred (error 2318), reason:halt, Unknown option ''x'' [c]' ]
			ifFalse: [ '-x something' -> 'UserDefinedError: Unknown option ''x'' [c]' ].
		gs37
			ifTrue: [ '-x' -> 'a UserDefinedError occurred (error 2318), reason:halt, Unknown option ''x'' [c]' ]
			ifFalse: [ '-x' -> 'UserDefinedError: Unknown option ''x'' [c]' ].
		gs37
			ifTrue: [ '--none=something' -> 'a UserDefinedError occurred (error 2318), reason:halt, Unexpected argument ''something'' for option ''none''' ]
			ifFalse: [ '--none=something' -> 'UserDefinedError: Unexpected argument ''something'' for option ''none''' ].
	}
%
