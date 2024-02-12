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

		'--another=123' -> 'UserDefinedError: The required option ''must'' was not set.'.
		'--must=must -a 123 --another=123' -> 'UserDefinedError: The option ''another'' has already been processed.'.
		'--must=must -n --none' -> 'UserDefinedError: The option ''none'' has already been processed.'.
		'--must=must -n -n' -> 'UserDefinedError: The option ''none'' has already been processed.'.
		'--must=must -a 123 --another=456' -> 'UserDefinedError: The option ''another'' has already been processed.'.
		'-m must -a --noshort' -> 'UserDefinedError: Missing required argument for option ''another'' [a]'.
		'-m must --another' -> 'UserDefinedError: Missing required argument for option ''another'' [b]'.
		'-m must -an' -> 'UserDefinedError: Missing required argument for option ''another'' [c]'.
		'-m must -a' -> 'UserDefinedError: Missing required argument for option ''another'' [d]'.
		'-a' -> 'UserDefinedError: Missing required argument for option ''another'' [d]'.
		'-' -> 'UserDefinedError: Cannot handle naked dashes ''-'''.
		'--unknown=something' -> 'UserDefinedError: Unknown option ''unknown'' [a]'.
		'--unknown' -> 'UserDefinedError: Unknown option ''unknown'' [b]'.
		'-x something' -> 'UserDefinedError: Unknown option ''x'' [c]'.
		'-x' -> 'UserDefinedError: Unknown option ''x'' [c]'.
		'--none=something' -> 'UserDefinedError: Unexpected argument ''something'' for option ''none'''.
	}
%
