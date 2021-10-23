exporting
exportTo: writeStream commandParser: commandParser executionClass: executionClass
	"METHOD commands are ignored on export. The instance side methods for executionClass will be exported in canonical order before the DOIT command"