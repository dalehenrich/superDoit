# superDoIt

BRANCH | STATUS
------------- | -------------
**v2** | [![**v2** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2)](https://github.com/dalehenrich/superDoit/actions)
**v2.0** | [![**v2.0** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2.0)](https://github.com/dalehenrich/superDoit/actions)

superDoit is a Smalltalk-based scripting language that runs on top of [GemStone/S 64](https://gemtalksystems.com/products/gs64/) using a free for commercial use [Community and Web Edition License](https://gemtalksystems.com/licensing/).
## Overview
TBD

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
