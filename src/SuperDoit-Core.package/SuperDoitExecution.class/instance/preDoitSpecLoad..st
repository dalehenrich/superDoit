doit
preDoitSpecLoad: specBlock
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	| projectSet rowanProjectSetDefinitionClass rowanVersion rowanClass rowanSemanticVersionNumberClass |
self stdout nextPUtAll: 'preDoitSpecLoad:  [1]'; lf.
	self _loadSpecs isEmpty
		ifTrue: [ ^ self ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [2]'; lf.
	rowanProjectSetDefinitionClass := SuperDoitExecution
		globalNamed: #'RwProjectSetDefinition'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specurls command' ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [3]'; lf.
	rowanClass := SuperDoitExecution globalNamed: 'Rowan'.
	rowanSemanticVersionNumberClass := SuperDoitExecution
		globalNamed: 'RwSemanticVersionNumber'.
	rowanVersion := (rowanClass respondsTo: #'version')
		ifTrue: [ rowanClass version ]
		ifFalse: [ rowanVersion := rowanSemanticVersionNumberClass fromString: '1.2.0' ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [4] :: ', rowanVersion printString; lf.
	rowanVersion < (rowanSemanticVersionNumberClass fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
self stdout nextPUtAll: 'preDoitSpecLoad:  [5] ::', spec projectName; lf.
					self class commandParserInstance projectsHome
						ifNotNil: [ :projectsHome | 
							"if projectsHome command is present, then prime the spec with the value"
							spec projectsHome: projectsHome ].
					specBlock cull: spec.
self stdout nextPUtAll: 'preDoitSpecLoad:  [6] ::', spec projectsHome asFileReference pathString; lf.
					spec resolve readProjectSet
						do: [ :project | projectSet addProject: project ] ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [7]'; lf.
			^ projectSet load ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [8] :: ', rowanVersion printString; lf.
	rowanVersion >= (rowanSemanticVersionNumberClass fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					specBlock cull: spec.
					spec resolveProject readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ].
self stdout nextPUtAll: 'preDoitSpecLoad:  [9]'; lf.