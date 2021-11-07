```bash
	cd solo
	curl  -L -O -s -S "https://github.com/dalehenrich/superDoit/releases/download/v0.1.0/3.6.1_extent0.solo.dbf.gz"
	gunzip --stdout 3.6.1_extent0.solo.dbf.gz > extent0.solo.dbf
	chmod -w extent0.solo.dbf
	$GS_HOME/bin/downloadGemStone 3.6.1
	ln -s $GS_HOME/shared/downloads/products/GemStone64Bit3.6.1-* product
```
