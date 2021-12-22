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
A typical Smalltalk IDE will provide a facility for writing Smalltalk code in a workspace or playground, where you can quickly put together a collection of Smalltalk expressions for evaluation without having to resort to creating a class.
It is natural that the simplicity of the workspace be preserved in the superDoit *doit* section.
The *doit* section contains the Smalltalk expressions to be executed and is terminated by *%*:
```
#!/usr/bin/env superdoit_solo
doit
^ 3 + 4
%
```
The script invokes the `superdoit_solo` program that arranges for [topaz solo](https://downloads.gemtalksystems.com/docs/GemStone64/3.5.x/GS64-Topaz-3.5/1-Tutorial.htm#pgfId-1125047) to be used to execute the *doit*.
### *options* section
As with any other scripting language it is an absolute requirement to allow for the declaration of command line arguments.
In **superDoit**, the *options* section is used to declare a set of command line options for the script:
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
and the framework automatically arranges for a method to be created using the `long` name of the option.
The value of the option from the command line is returned as a String by the method.
Here is the full list on command line options that are currently supported:
```
options
{
	SuperDoitOptionalOptionWithNoArg long: 'noarg'.
	SuperDoitOptionalOptionWithNoArg long: 'noarg' short: 'n'.

	SuperDoitOptionalOptionWithRequiredArg long: 'optional'.
	SuperDoitOptionalOptionWithRequiredArg long: 'optional' default: 'default'.
	SuperDoitOptionalOptionWithRequiredArg long: 'optional' short: 'o'.
	SuperDoitOptionalOptionWithRequiredArg long: 'optional' short: 'o' default: 'default'.

	SuperDoitRequiredOptionWithRequiredArg long: 'required'.
	SuperDoitRequiredOptionWithRequiredArg long: 'required' short: 'r'.
}
%
```
The SuperDoitOptionalOptionWithNoArg returns `true` if the option is present on the command line and `false` if it is not present on the command line.
The SuperDoitOptionalOptionWithRequiredArg returns `nil` or the default value if not specified on the command line or the value of the option as a String if specified on the command line.
The SuperDoitRequiredOptionWithRequiredArg signals an error if the option is not present on the command and the value of the option as a String if specified on the command line.

### *usage* section
It is also an absolute requirement that a scripting language provide usage information for the script.
The *usage* section contains structured help text that documents the script usage, terminated by *%*:
```
#!/usr/bin/env superdoit_solo
usage
-----
USAGE $basename [--help | -h] [--debug | -D]

DESCRIPTION
  Simple script that returns the result of evaluating `3+4`.

OPTIONS
  -h, --help                 display usage message
  -D, --debug                bring up topaz debugger in the event of a script error

EXAMPLES
  $basename --help
  $basename -D
-----
%
doit
  3 + 4
%
```
The -h, --help, -D, and --debug options are pre-defined and require no declarations to be included.
If you want to change the options used for help and debugging, then you can use the [*customptions* section](examples/kitchenSink/uncommonCommandExample.stone#L6-L19)
### *method* section
For those of you familiar with working with Smalltalk workspaces, you will acknowledge that it doesn't take too long before the size of the script of becomes unwieldly ... {TO BE CONTINUED}
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


