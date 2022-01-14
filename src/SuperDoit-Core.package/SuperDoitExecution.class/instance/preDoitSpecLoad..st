doit
preDoitSpecLoad: specBlock
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	| projectSet rowanProjectSetDefinitionClass rowanVersion rowanClass rowanSemanticVersionNumberClass |
	self _loadSpecs isEmpty
		ifTrue: [ ^ self ].
	rowanProjectSetDefinitionClass := SuperDoitExecution
		globalNamed: #'RwProjectSetDefinition'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specurls command' ].
	rowanClass := SuperDoitExecution globalNamed: 'Rowan'.
	rowanSemanticVersionNumberClass := SuperDoitExecution
		globalNamed: 'RwSemanticVersionNumber'.
	rowanVersion := (rowanClass respondsTo: #'version')
		ifTrue: [ rowanClass version ]
		ifFalse: [ rowanVersion := rowanSemanticVersionNumberClass fromString: '1.2.0' ].
	rowanVersion <= (rowanSemanticVersionNumberClass fromString: '2.2.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					spec projectsHome
						ifNil: [ 
							self class commandParserInstance projectsHome
								ifNotNil: [ :projectsHome | 
									"if projectsHome command is present, then prime the spec with the value"
									spec projectsHome: projectsHome ].
							specBlock cull: spec ].
					spec resolve readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ].
	rowanVersion >= (rowanSemanticVersionNumberClass fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					specBlock cull: spec.
					spec resolveProject readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ]