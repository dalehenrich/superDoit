*superdoit-stone-core
fileStreamFor: aFilePath
	^ (System myUserProfile objectNamed: 'FileStream')
		ifNotNil: [ :fileStreamClass | fileStreamClass fileNamed: aFilePath ]
		ifNil: [ GsFile openReadOnServer: aFilePath ]