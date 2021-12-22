# superDoIt

BRANCH | STATUS
------------- | -------------
**v2** | [![**v2** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2)](https://github.com/dalehenrich/superDoit/actions)
**v2.0** | [![**v2.0** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2.0)](https://github.com/dalehenrich/superDoit/actions)
**v2.1** | [![**v2.1** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2.1)](https://github.com/dalehenrich/superDoit/actions)

## What is superDoit?
superDoit is a Smalltalk-based scripting framework  for writing shell scripts in [GemStone Smalltalk](https://gemtalksystems.com/products/gs64/) using a free for commercial use [Community and Web Edition License](https://gemtalksystems.com/licensing/).
The script file is composed of a set of structured sections: [*doit*](#doit-section), [*options*](#options-section), [*usage*](#usage-section), [*method*](#method-section), and [*others*](#others).
 
### *doit* section
Smalltalk doit section, *doit* section contains Smalltalk expressions to be executed, terminated by *%*:
```
#!/usr/bin/env superdoit_solo
doit
^ 3 + 4
%
```
### *options* section
Command line option declaration and support. *options* section is a Smalltalk Array of option definitions, terminate by *%*. The value of the option can be retrieved by sending a message using the long name of the option:
```
#!/usr/bin/env superdoit_solo
options
{
  SuperDoitRequiredOptionWithRequiredArg long: 'addend' short: 'a'.
}
%
doit
  ^ 3 + (self addend) asNumber
%
```
### *usage* section
Help text support. *usage* sections contains structured help text that documents the script usage, terminated by *%*:
```
#!/usr/bin/env superdoit_solo
options
{
  SuperDoitRequiredOptionWithRequiredArg long: 'addend' short: 'a'.
}
%
usage
-----
USAGE $basename [--help | -h] [--debug | -D] --addend=<number> | -a <number>

DESCRIPTION
  Evaluate the Smalltalk expression: 3+addend and return the result on stdout.

OPTIONS
  -a <num>, --addend=<num>   number to be added to 3
  -h, --help                 display usage message
  -D, --debug                bring up topaz debugger in the event of a script error

EXAMPLES
  $basename --help
  $basename -D
  $basename --addend=5
  $basename -a 100
-----
%
doit
  (self addend) asNumber + 3
%
```
The -h, --help, -D, and --debug options are pre-defined.
The -h and --help options displays the usage section on stdout and exits the script.
The -D and --debug cause the topaz debugger to be invoked in the case of an error.
### *method* section
Declaration of script methods. *method* section defines a Smalltalk method, terminated by *%*, that can be called from within the script:
```
#!/usr/bin/env superdoit_solo
options
{
  SuperDoitRequiredOptionWithRequiredArg long: 'addend' short: 'a'.
}
%
method
constant
  ^ 3
%
doit
  ^ self constant + (self addend) asNumber
%
```
### **others**
[*instars* section](examples/kitchenSink/commonCommandExample.stone#L58-L60) defines script instance variables.

[*input* section](examples/kitchenSink/uncommonCommandExample.stone#L61-L62) can be used to load GemStone .gs files into the image.

[*projectshome* section](examples/kitchenSink/uncommonCommandExample.stone#L63-L64) is used to declare the value of the ROWAN_PROJECTS_HOME environment variable during the execution of the script.

[*specs* section](examples/kitchenSink/uncommonCommandExample.stone#L63-L64) contains an array of Rowan load specification STON objects used to load external projects into the image.

[*specurls* section](examples/kitchenSink/uncommonCommandExample.stone#L67-L68) contains a list of spec urls that reference the location of a Rowan load specification STON object.

[*classmethod:* section](examples/kitchenSink/uncommonCommandExample.stone#L73-L76) is used to define a class method for a class that is already present in the image.

[*customptions* section](examples/kitchenSink/uncommonCommandExample.stone#L6-L19) is used to override the default command line arguments: -h, --help, -D, and --debug.

superDoit scripts come in three flavors
1. **.solo scripts** - standalone GemStone Smalltalk scripts that can be run without a stone
2. **.stone scripts** - GemStone Smalltalk scripts that are run against a particular stone
3. **.topaz scripts** - GemStone topaz sripts that are run against a particular stone


### superdoit_solo scripts
### superdoit_stone scripts
### superdoit_topaz scritps


## updated Installation for .solo scripts
1. download 3.6.1 product tree
   ```bash
   cd gemstone/products
   ../../dev/downloadGemStone.sh 3.6.1
   ```
2. download 3.6.1 solo extent
   ```bash
   cd ../solo
   curl  -L -O -s -S "https://github.com/dalehenrich/superDoit/releases/download/v0.1.0/3.6.1_extent0.solo.dbf.gz"
   gunzip --stdout 3.6.1_extent0.solo.dbf.gz > extent0.solo.dbf
   chmod -w extent0.solo.dbf
   ln -s ../products/GemStone64Bit3.6.1-x86_64.Linux product
   ```
3. Add `superDoit/bin` to your PATH:
   ```bash
   export PATH="$GS_HOME/shared/repos/superDoit/bin":$PATH
   ```
   It is recommended that you add this expression to your .bashrc so that .solo scripts can be run without any special setup.
## Examples
### simplest executable .solo doit 
```
#!/usr/bin/env superdoit_solo
doit
3+4
%
```
### simple executable .solo doit with default help and debugging options
```
#!/usr/bin/env superdoit_solo
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
	3+4
%
```
### executable .solo doit with methods and Rowan specs
```
#!/usr/bin/env superdoit_solo
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
usage
USAGE $basename [--help | -h] [--debug | -D]
... and more
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
^ self x
%
```

## Branch conventions
1. vX
2. vX.Y
3. vX.Y.Z or vX.Y.Z-id

### vX
Production branch.

X is incremented whenever there is a breaking change.
vX.Y and vX.Y.Z branches are merged into the VX branch, when development is complete on the feature or patch.

### vX.Y
Feature/Bug candidate branch.
 
Y is incremented whenever work on a new feature or bugfix is started.
vX.Y branches are merged into the VX branch when development is complete.

Primary work takes place on a vX.Y.Z branch and the VX.Y.Z branch is merged into the VX.Y branch at stable points, so if you want to have early access to a feature or bugfix, it is relatively safe to use this branch in production.

### vX.Y.Z
Development branch.

Z is incremented whenever work on a new feature or bugfix is started.
A pre-release may be used to further identify the purpose of the work.

Primary work takes place on this branch and cannot be depended upon to be stable.


