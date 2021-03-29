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
		'--noshort=123 --must=must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'noshort' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--noshort --must=must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'noshort' put: '0';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--optional=123 --must=must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--optional --must=must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '0';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-o 123 --must=must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-o -m must' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '0';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'-o 123 456 --required=789 12 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' . '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '123';
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'123 -o --required=456 789 -m must' -> (Dictionary new
			at: 'args' 
				put: { '123' . '789' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'optional' put: '0';
						at: 'required' put: '456';
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
		'-on 456 --required=789 12 -m must' -> (Dictionary new
			at: 'args' 
				put: { '456' . '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'optional' put: '0';
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -no 456 --required=789 12' -> (Dictionary new
			at: 'args' 
				put: { '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'optional' put: '456';
						at: 'required' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -on 456 --required=789 12' -> (Dictionary new
			at: 'args' 
				put: { '456' . '12' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'optional' put: '0';
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
		'--must=must -a 123 -no 456 789' -> (Dictionary new
			at: 'args' 
				put: { '789' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'optional' put: '456';
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must -nDoa 123 456' -> (Dictionary new
			at: 'args' 
				put: { '456' };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'debug' put: true;
						at: 'optional' put: '0';
						at: 'another' put: '123';
						at: 'must' put: 'must';
						yourself);
			yourself).

		'--must=must --required=123 -o 456 -a 789 -n' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '123';
						at: 'optional' put: '456';
						at: 'another' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).
		'--must=must --required=123 --optional=456 --another=789 --none' -> (Dictionary new
			at: 'args' 
				put: { };
			at: 'options'
				put: 
					(Dictionary new
						at: 'none' put: true;
						at: 'required' put: '123';
						at: 'optional' put: '456';
						at: 'another' put: '789';
						at: 'must' put: 'must';
						yourself);
			yourself).

		'--another=123' -> 'The required option ''must'' was not set.'.
		'--must=must -a 123 --another=123' -> 'The option ''another'' has already been processed.'.
		'--must=must -n --none' -> 'The option ''none'' has already been processed.'.
		'--must=must -n -n' -> 'The option ''none'' has already been processed.'.
		'--must=must -o 123 --optional' -> 'The option ''optional'' has already been processed.'.
		'-m must -a --optional=123' -> 'Missing required argument for option ''another'' [a]'.
		'-m must --another' -> 'Missing required argument for option ''another'' [b]'.
		'-m must -an' -> 'Missing required argument for option ''another'' [c]'.
		'-m must -a' -> 'Missing required argument for option ''another'' [d]'.
		'-a' -> 'Missing required argument for option ''another'' [d]'.
		'-' -> 'Cannot handle naked dashes ''-'''.
		'--unknown=something' -> 'Unknown option ''unknown'' [a]'.
		'--unknown' -> 'Unknown option ''unknown'' [b]'.
		'-x something' -> 'Unknown option ''x'' [c]'.
		'-x' -> 'Unknown option ''x'' [c]'.
		'--none=something' -> 'Unexpected argument ''something'' for option ''none'''.
	}
%
