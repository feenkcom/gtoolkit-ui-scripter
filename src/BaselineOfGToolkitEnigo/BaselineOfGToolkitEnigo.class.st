Class {
	#name : #BaselineOfGToolkitEnigo,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfGToolkitEnigo
}

{ #category : #baselines }
BaselineOfGToolkitEnigo >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'GToolkitInstaller' with: [ spec repository: 'github://feenkcom/gtoolkit-installer/src' ];
			baseline: 'GToolkitBoxer' with: [ spec repository: 'github://feenkcom/gtoolkit-boxer/src' ];
			baseline: 'GtThreadedFFIDev' with: [ spec repository: 'github://feenkcom/tffi-dev/src' ].
		spec
			postLoadDoIt: #'postLoadEnigo:';
			package: 'GToolkit-Enigo' with: [ spec requires: 
				#(GToolkitInstaller GToolkitBoxer GtThreadedFFIDev) ] ]
]

{ #category : #baselines }
BaselineOfGToolkitEnigo >> postLoadEnigo: spec [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].

	PostLoaded := true.
	self postLoadInstallEnigoBinary: spec
]

{ #category : #baselines }
BaselineOfGToolkitEnigo >> postLoadInstallEnigoBinary: aSpec [
	(self class environment at: #GtEnigoLibrary) install
]
