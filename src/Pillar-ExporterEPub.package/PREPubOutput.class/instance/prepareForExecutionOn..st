accessing
prepareForExecutionOn: aPRProject 

	"As a temporary solution, remove the old results folder before building the document.
	This should be replaced by a smarter solution replacing only modified files"
	| configuration |
	aPRProject wipeout.
	
	configuration := (PRPillarConfiguration newFromDictionary: {
		#_outputFormat -> self.
	} asDictionary)
		parent: aPRProject configuration;
		yourself.
	
	(PRCopyPhase directory: '_support')
		configuration: configuration;
		executeOn: (PRCompilationContext new configuration: configuration; yourself).