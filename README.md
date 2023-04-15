# superDoIt

BRANCH | STATUS
------------- | -------------
**v3** | [![**v3** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v3)](https://github.com/dalehenrich/superDoit/actions)
**v3.1** | [![**v3.1** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v3.1)](https://github.com/dalehenrich/superDoit/actions)
**v2** | [![**v2** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2)](https://github.com/dalehenrich/superDoit/actions)
**v2.0** | [![**v2.0** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2.0)](https://github.com/dalehenrich/superDoit/actions)
**v2.1** | [![**v2.1** build status](https://github.com/dalehenrich/superDoit/actions/workflows/ci.yml/badge.svg?branch=v2.1)](https://github.com/dalehenrich/superDoit/actions)

## Versions
### v3
Intended for .solo scripts used with versions of GemStone that are shipped with an extent0.rowan.dbf in $GEMSTONE/bin, GemStone 3.6.4 and newer versions of GemStone (currently tested thru 3.6.5). 

.stone scripts may be used with GemStone versions as old as 3.4.0.

### v3.1
Stable branch for use by [smalltalkCI](https://github.com/hpi-swa/smalltalkCI)

### v2
Intended for use with older versions of GemStone: 3.6.1, 3.6.0, 3.5.7, 3.5.0 (tested versions)

## Table of Contents
1. [What is superDoit?](#what-is-superdoit)
   - [Current best practices](#current-best-practices)
   - [superDoit solution](#superDoit-solution)
2. [solo, stone, and topaz scripts](#solo-stone-and-topaz-scripts)
   - [.solo script](#solo-script)
   - [.stone script](#stone-script)
   - [.topaz script](#topaz-script)
2. [superDoit sections](#superdoit-sections)
3. [Installation](#superdoit-installation)
4. [Examples](#examples)
   - [executable .solo doit with methods and Rowan specs](#executable-solo-doit-with-methods-and-rowan-specs)
2. [How does superDoit work?](#how-does-superdoit-work)
3. [Rowan and superDoit](#rowan-and-superdoit)
3. [Branch naming conventions](#branch-naming-conventions)

## What is superDoit?
`superDoit` is a scripting framework for writing shell scripts in [GemStone Smalltalk](https://gemtalksystems.com/products/gs64/) using [GemStone Topaz][topaz manual]. To install:
```bash
	cd <install dir>
  git clone git@github.com:dalehenrich/superDoit.git
	superDoit/bin/install.sh
```

### Current best practices
Current best practices for writing a [topaz solo bash scripts to report the sum total size of tranlog files in the given directory][Topaz Solo Scripting using bash to pass arguments] involves creating 3 separate files (see [Scripting with topaz solo using sh-bang][Scripting with topaz solo using she-bang] for resons why 3 files are needed to handle command line arguments in topaz solo scripts):
1. a bash script driver script named [gettranlogspace][gettranlogspace]:
   ```
   #!/bin/bash
   export GEMSTONE=/lark1/users/gsadmin/3.6
   $GEMSTONE/bin/topaz -lq -I $GEMSTONE/scripts/myini -S
   $GEMSTONE/scripts/reporttranlogspace.tpz -- $1
   ```
2. a solo .topazini file named [myini][myini]:
   ```
   set user DataCurator pass swordfish
   set gemstone gs64stone
   set solologin on
   ```
3. a [topaz command file][topaz manual] named [reporttranlogspace.tpz][reporttranlogspace.tpz], that contains the Smalltalk code to calculate and report the sum of the tranlog sizes in the directory:
   ```
   login
   run
     | dir files sz |
     dir := System commandLineArguments last.
     files := GsFile 
        contentsOfDirectory: dir
        onClient: false.
     sz := 0.
     files do: [:ea | sz := sz + (GsFile sizeOfOnServer: ea)].
     GsFile gciLogClient: dir, ': tranlogs consume total ', 
        (sz / 1024) asInteger asString, ' KB'.
   %
   logout
   exit
   ```
The bash driver script would then be executed:
```
unix> ./gettranlogspace /lark1/users/gsadmin/tranlogs
/lark1/users/gsadmin/tranlogs: tranlogs consume total 98477 KB
```

### superDoit solution
`superDoit` not only eliminates the need to create three separate files to run a solo script, but provides support for declaring command line options, help, debugging and [more](#superdoit-sections).

Here is the `superDoit` version of [reporttranlogspace.solo][reporttranlogspace.solo]:
```
#!/usr/bin/env superdoit_solo
options
{
  SuperDoitRequiredOptionWithRequiredArg long: 'tranlogDir' short: 't'.
}
%
usage
-----
USAGE $basename [--help | -h] [--debug | -D] --tranlogDir=<tranlog-directory-path>

DESCRIPTION
  Calculate and report the sum of the tranlog sizes in the given <tranlog-directory-path>

OPTIONS
  -t, --tranlogDir=<tranlog-directory-path>
                             path to tranlog directory
  -h, --help                 display usage message
  -D, --debug                bring up topaz debugger in the event of a script error

EXAMPLES
  $basename --help
  $basename -D -t <tranlog-directory-path>
  $basename -t <tranlog-directory-path>
  $basename --tranlogDir=<tranlog-directory-path>
-----
%
doit
  | sz |
  sz := 0.
  self tranlogDir asFileReference files
    do: [:tranlogFile |
      sz := sz + tranlogFile size ].
  self stdout
    nextPutAll: self tranlogDir;
    nextPutAll: ': tranlogs consume total ';
    nextPutAll: (sz / 1024) asInteger asString, ' KB'.
  ^ self noResult
%
```
**Executing** `./reporttranlogspace.solo -t $GS_HOME/server/stones/gs_361/tranlogs` produces:
```
/home/dhenrich/rogue/_homes/rogue/_home/server/stones/gs_361/tranlogs: tranlogs consume total 39617 KB
```
**Executing** `./reporttranlogspace.solo -h ` produces:
```
-----
USAGE reporttranlogspace.solo [--help | -h] [--debug | -D] --tranlogDir=<tranlog-directory-path>

DESCRIPTION
  Calculate and report the sum of the tranlog sizes in the given <tranlog-directory-path>

OPTIONS
  -t, --tranlogDir=<tranlog-directory-path>
                             path to tranlog directory
  -h, --help                 display usage message
  -D, --debug                bring up topaz debugger in the event of a script error

EXAMPLES
  reporttranlogspace.solo --help
  reporttranlogspace.solo -D -t <tranlog-directory-path>
  reporttranlogspace.solo -t <tranlog-directory-path>
  reporttranlogspace.solo --tranlogDir=<tranlog-directory-path>
-----
```
**Executing** `./reporttranlogspace.solo` produces:
```
UserDefinedError: The required option 'tranlogDir' was not set.
```
**Executing** `./reporttranlogspace.solo -D` and entering `where` at topaz prompt produces:
```
-----------------------------------------------------
 Near line 62 of file /home/dhenrich/rogue/_homes/rogue/_home/shared/repos/superDoit/gemstone/superdoit.tpz
GemStone: Error         Nonfatal
a UserDefinedError occurred (error 2318), reason:halt, The required option 'tranlogDir' was not set.
Error Category: 231169 [GemStone] Number: 2318  Arg Count: 1 Context : 20 exception : 102530817
Arg 1: [20 size:0 primitiveSize:0 cls: 76289 UndefinedObject] nil
Stopping at line 62 of /home/dhenrich/rogue/_homes/rogue/_home/shared/repos/superDoit/gemstone/superdoit.tpz
topaz 1> where
==> 1 UserDefinedError (AbstractException) >> _signalToDebugger @10 line 8   [methId 101346817]
2 UserDefinedError (AbstractException) >> defaultAction @2 line 18   [methId 101347073]
3 UserDefinedError (AbstractException) >> _defaultAction @4 line 4   [methId 101346305]
4 UserDefinedError (AbstractException) >> _signal @2 line 20   [methId 3833089]
5 UserDefinedError (AbstractException) >> signal @2 line 47   [methId 3848449]
6 SuperDoitExecutionClass (Object) >> error:    @6 line 7   [methId 6400001]
7 [] in SuperDoitExecution >> getAndVerifyOptions @21 line 12   [methId 102538497]
8 Dictionary >> keysAndValuesDo:                @9 line 11   [methId 12241665]
9 SuperDoitExecutionClass (SuperDoitExecution) >> getAndVerifyOptions @10 line 8   [methId 102499841]
10 [] in SuperDoitExecution >> doit              @6 line 5   [methId 102543617]
11 ExecBlock0 (ExecBlock) >> on:do:              @3 line 44   [methId 5850369]
12 SuperDoitExecutionClass (SuperDoitExecution) >> doit @2 line 8   [methId 102546689]
13 SuperDoitDoitCommand >> executeAgainst:       @27 line 19   [methId 102584833]
14 [] in SuperDoitCommandDefinition >> executeAgainst: @7 line 2   [methId 102500609]
15 OrderedCollection (Collection) >> do:         @5 line 10   [methId 3419649]
16 SuperDoitCommandDefinition >> executeAgainst: @3 line 2   [methId 102502913]
17 [] in SuperDoitCommandParser >> parseAndExecuteScriptFile: @22 line 15   [methId 102511105]
18 [] in AbstractFileReference >> readStreamDo:  @8 line 4   [methId 48130817]
19 ExecBlock0 (ExecBlock) >> ensure:             @2 line 12   [methId 5852161]
20 FileReference (AbstractFileReference) >> readStreamDo: @4 line 5   [methId 42354689]
21 SuperDoitCommandParser >> parseAndExecuteScriptFile: @2 line 3   [methId 102520577]
22 SuperDoitCommandParser class >> processInputFile @31 line 22   [methId 102519297]
23 Executed Code                                 @2 line 6   [methId 102553601]
24 GsNMethod class >> _gsReturnToC               @1 line 11   [methId 5673729]
  [GsProcess 102639105]
topaz 1> 
```
**Executing** `./reporttranlogspace.solo --tranlogDir`produces:
```
UserDefinedError: Missing required argument for option 'tranlogDir' [b]
```
**Executing** `./reporttranlogspace.solo -t`produces:
```
UserDefinedError: Missing required argument for option 'tranlogDir' [d]
```
**Executing** `./reporttranlogspace.solo -t /tmp/oops`produces:
```
DirectoryDoesNotExist: Path / 'tmp' / 'oops'
```
Of course adding `-D` or `--debug` to any of the the above, will bring up the debugger and allow you to debug the error yourself.

For the complete list of `superDoit` file sections see [superDoit Sections](#superdoit-sections)

## solo, stone, and topaz scripts
`superDoit` scripts come in three flavors: [solo](#solo-script), [stone](#stone-script), [topaz](#topaz-script). By convention each type of script is identified by a .solo, .stone, .topaz file extenstion, so that users will know how to run and what to expect from the script.

### solo script
solo scripts use a `solo login`, [a special kind of login, which does not require a running Stone. This allows a Gem session to start up and execute GemStone Smalltalk code (based on reading from a GemStone extent file), without any connection to a Stone. Without a Stone, a solo session is single-user, and changes to persistent objects cannot be committed. Solo sessions cannot, for example, run markForCollection in their own environments, nor execute methods that make or restore backups.][Topaz Solo for Scripting].

solo scripts start with a `#!/usr/bin/env superdoit_solo` shebang and `<path-to-superDot-git-clone>/bin/superdoit_solo` needs to be in your path:
```
#!/usr/bin/env superdoit_solo
doit
^ 3 + 4
%
```
solo scripts are run against an extent with [Rowan v2.2 installed](#rowan-and-superdoit). 

See [.solo script installation](#solo-script-installation) for additional information about installing a topaz solo extent and product tree.

### .stone script
The *doit* section contains the Smalltalk expressions to be executed and is terminated by *%*:
```
#!/usr/bin/env superdoit_stone
doit
^ 3 + 4
%
```

### .topaz script
The *doit* section contains the Smalltalk expressions to be executed and is terminated by *%*:
```
#!/usr/bin/env superdoit_topaz
set u SystemUser p swordfish
set gemstone gs64stone
login

run
GsFile stdout nextPutAll: (3 + 4) printString; lf
%
```

## superDoit sections
Here is a complete list of the sections that may be used in a `superDoit` script:
1. [*doit*](#-section)
2. [*options*](#options-section)
3. [*usage*](#usage-section)
1. [*method*](#method-section)
2. [*instvars*](#instvars-section)
3. [*input*](#input-section)
4. [*method:*](#method-section-1)
5. [*classmethod:*](#classmethod-section)
6. [*customoptions*](#customoptions-section)
7. [*projectshome*](#projectshome-section)
8. [*specs*](#specs-section)
9. [*specurls*](#specurls-section).

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
I'm sure that all of us have written workspaces that could have benefited from a local method or two and shell scripts are no different, superDoit makes it possible to add local methods to the script. 
The *method* section defines a Smalltalk method, terminated by *%*, that can be called from within the script:
```
#!/usr/bin/env superdoit_solo
usage
-----
USAGE $basename [--help | -h] [--debug | -D]

DESCRIPTION
  Simple script that demonstrates the definition and use of a script method.

EXAMPLES
  $basename --help
  $basename -D
-----
%
method
three
  ^ 3
%
doit
  ^ self three + 4
%
```
### *instvars* section
If you are going to allow methods in scripts, then you need to allow instance variables for sharing common state. 
The [*instvars* section](examples/kitchenSink/commonCommandExample.stone#L58-L60), terminated by *%* defines script instance variables.

### *input* section
The [*input* section](examples/kitchenSink/uncommonCommandExample.stone#L61-L63)), terminated by *%* can be used to load GemStone .gs files into the image.

### *method:* section
The [*method:* section](examples/kitchenSink/uncommonCommandExample.stone#L94-L97)), terminated by *%* is used to define an instance method for a class that is already present in the image.

### *classmethod:* section
The [*classmethod:* section](examples/kitchenSink/uncommonCommandExample.stone#L98-L101)), terminated by *%* is used to define a class method for a class that is already present in the image.

### *customoptions* section
The [*customptions* section](examples/kitchenSink/uncommonCommandExample.stone#L6-L19)), terminated by *%* is used to override the default command line arguments: -h, --help, -D, and --debug.

### *projectshome* section
The [*projectshome* section](examples/kitchenSink/uncommonCommandExample.stone#L64-L66), terminated by *%* is used to declare the value of the ROWAN_PROJECTS_HOME environment variable during the execution of the script.

### *specs* section
The [*specs* section](examples/kitchenSink/uncommonCommandExample.stone#L67-L90), terminated by *%* contains an array of Rowan load specification STON objects used to load external projects into the image.

### *specurls* section
The [*specurls* section](examples/kitchenSink/uncommonCommandExample.stone#L91-L93), terminated by *%* contains a list of spec urls that reference the location of a Rowan load specification STON object.

## superDoit installation
### .solo script installation
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
	self preDoitSpecLoad.	"load specs"
^ self x
%
```

## How does superDoit work?

## Rowan and superDoit
*Note:* As of December, 2021, [Rowan v2.2][Rowan] and [Jadeite][Jadeite] should be treated as beta/alpha releases:
1. GemStone upgrade of a Rowan extent is not supported.
2. The Rowan API is not complete.
3. [Jadeite][Jadeite] the Rowan IDE is not fully functional.

However, with that said:
1. Rowan v2.2. sports a GemStone port of [FileSystem][FileSystem] which greatly improves the File manipulation API for GemStone, a critical capability for scripting
2. Rowan v2.2 can be used for loading external projects into a topaz solo stone. 
For example, an [OrderedDictionary .superDoitCI.solo][OrderedDictionary .superDoitCI.solo] script is used to run [Github CI for a port of OrderedDictionary to the GemStone kernel using Rowan][OrderedDictionary github action]

## Branch naming conventions
1. vX
2. vX.Y
3. vX.Y.Z or vX.Y.Z-id

### vX
Stable production branch.

X is incremented whenever there is a breaking change.
vX.Y and vX.Y.Z branches are merged into the VX branch, when development is complete on the feature or patch.

### vX.Y
Stable feature/bugfix candidate branch.
 
Y is incremented whenever work on a new feature or bugfix is started.
vX.Y branches are merged into the VX branch when development is complete.

Primary work takes place on a vX.Y.Z branch and the VX.Y.Z branch is merged into the VX.Y branch at stable points, so if you want to have early access to a feature or bugfix, it is relatively safe to use this branch in production.

### vX.Y.Z
Unstable development branch.

Z is incremented whenever work on a new feature or bugfix is started.
A pre-release may be used to further identify the purpose of the work.

Primary work takes place on this branch and cannot be depended upon to be stable.

[topaz manual]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/GS64-Topaz-3.6.htm
[Scripting with topaz solo using she-bang]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1131973
[Topaz Solo Scripting using bash to pass arguments]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1126780
[Topaz Solo for Scripting]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1125047
[gettranlogspace]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1126891
[myini]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1127344
[reporttranlogspace.tpz]: https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1127310

[reporttranlogspace.solo]: examples/utility/reporttranlogspace.solo
[Rowan]: https://github.com/GemTalk/Rowan
[Jadeite]: https://github.com/GemTalk/Jadeite
[FileSystem]: https://github.com/pharo-project/pharo/tree/Pharo9.0/src/FileSystem-Core
[OrderedDictionary .superDoitCI.solo]: https://github.com/GsDevKit/OrderedDictionary/blob/rowanize/.superDoitCI.solo
[OrderedDictionary github action]: https://github.com/GsDevKit/OrderedDictionary/runs/4415167050?check_suite_focus=true#step:5:27
