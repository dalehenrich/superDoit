doit
preDoitSpecLoad: specBlock
	"create a project set from the specs and load the whole enchilada"

	"return list of RwProjects loaded"

	| projectSet rowanProjectSetDefinitionClass rowanVersion |
	self _loadSpecs isEmpty
		ifTrue: [ ^ self ].
	rowanProjectSetDefinitionClass := SuperDoitExecution
		globalNamed: #'RwProjectSetDefinition'
		ifAbsent: [ 
			self
				error:
					'Rowan must be present in the image in order to use the specurls command' ].
	rowanVersion := (Rowan respondsTo: #'version')
		ifTrue: [ Rowan version ]
		ifFalse: [ rowanVersion := RwSemanticVersionNumber fromString: '1.2.0' ].
	rowanVersion <= (RwSemanticVersionNumber fromString: '2.2.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					specBlock cull: spec.
					spec resolve readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ].
	rowanVersion >= (RwSemanticVersionNumber fromString: '3.0.0')
		ifTrue: [ 
			projectSet := rowanProjectSetDefinitionClass new.
			self _loadSpecs
				do: [ :spec | 
					specBlock cull: spec.
					spec resolveProject readProjectSet
						do: [ :project | projectSet addProject: project ] ].
			^ projectSet load ]