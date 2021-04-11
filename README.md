# superDoIt

### dkh branch [![**dkh** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=dkh)](https://github.com/dalehenrich/superDoit/actions)

### install
**TBD - requires GemStone 3.7.0, which has not been released**

### usage
Add `superDoit/bin` to you path and you're good to go ...

### simple executable doit 
```
#!/usr/bin/env superdoit
doit
3+4
%
```
### simple executable doit with help and debugging options
```
#!/usr/bin/env superdoit_solo
options
{
  SuperDoitCommandLineOption long: 'help' short: 'h'.
  SuperDoitCommandLineOption long: 'debug' short: 'D'.
}
%
usage
USAGE $basename [--help | -h] [--debug | -D]

DESCRIPTION
  Evaluate the Smalltalk expression: 3+4 and return the result on stdout.

OPTIONS
 --help | -h
    Display usage message.
  --debug | -D
    Without this option, when an error occurs, the error message is written to
      stdout. If this option is supplied, the topaz debugger will come in the 
      event of an error.

EXAMPLES
  $basename --help
  $basename -h
  $basename --debug
  $basename -D
  $basename
%
doit
	[
		self getOpts: self optionSpecs.
	] on: Error do: [:ex | 
		self debug ifFalse: [ ^ ex description ].
		ex pass ].
	self help ifTrue: [ ^ self usage ].
	3+4
%
```
### executable doit with methods and specs
```
#!/usr/bin/env superdoit
specUrls
https://raw.github.com/dalehenrich/RowanSample9/spec_0002/rowan/specs/spec_0002.ston
%
specs
RwLoadSpecificationV2 {
	#specName : 'spec_0022',
	#projectName : 'RowanSample9',
	#gitUrl : 'git@github.com:dalehenrich/RowanSample9.git',
	...
}
%
options
{ SuperDoitCommandLineOption long: 'option' short: 'o' }
%
usage
USAGE $basename [--debug | -D]
... and more
%

instvars
%
method
x
^ self y
%
method
y
^ 3+4
%
doit
self getOpts: self optionSpecs.
^ self x
%
```
