tests
testKeepHeaderWithOneHeader
	| input expected |
	input := PRDocument new
		add: (PRHeader new
				level: 1;
				add: (PRText content: 'foo');
				yourself);
		yourself.
	expected := PRDocument new
		add: (PRSection new
				add: (PRHeader new
						level: 1;
						add: (PRText content: 'foo');
						yourself);
				yourself);
		yourself.
	self
		assert:
			(self
				executePhase: input
				with:
					(self configuration
						outputType: self actualWriterClass;
						propertyAt: #_outputFormat put: self actualWriterClass new;
						disabledPhases: { #templating };
						yourself))
		equals: expected