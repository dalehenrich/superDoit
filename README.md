# superDoIt

### install
**TBD - requires GemStone 3.7.0, which has not been released**

### usage
Add `superDoit/bin` to you path and you're good to go ...

### simple executable doit 
```
#!/usr/bin/env superdoit
3+4
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
instvars
%
method
x
self y
%
method
y
^ 3+4
%
doit
self x
%
```
