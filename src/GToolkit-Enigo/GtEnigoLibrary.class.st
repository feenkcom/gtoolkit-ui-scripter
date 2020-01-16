Class {
	#name : #GtEnigoLibrary,
	#superclass : #FFILibrary,
	#classInstVars : [
		'MouseWheelScrollSpeed'
	],
	#category : #'GToolkit-Enigo-Library'
}

{ #category : #'library path' }
GtEnigoLibrary class >> ffiLibraryName [
	^ self
]

{ #category : #installation }
GtEnigoLibrary class >> install [
	<script: 'self install'>
	| installer |

	installer := GtLibraryInstaller new.
	installer library: 'Enigo'.
	installer version: 'development'.
	installer icon: (Form extent: 1@1 depth: 32).
	installer binary: 'libEnigo'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
	installer works: [ GtEnigoLibrary uniqueInstance hasModule ].

	installer run
]

{ #category : #'private - ffi' }
GtEnigoLibrary >> calloutAPIClass [
	^ ThreadedFFIMigration threadedFFIAvailable
		ifTrue: [ TFCalloutAPI ]
		ifFalse: [ super calloutAPIClass ]
]

{ #category : #'accessing platform' }
GtEnigoLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #testing }
GtEnigoLibrary >> hasModule [
	"Return if there is a loadable and working Enigo library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'accessing platform' }
GtEnigoLibrary >> macModuleName [
	^ self detectLibrary: 'libEnigo.dylib'
]

{ #category : #'private - ffi' }
GtEnigoLibrary >> primTest [
	^ self ffiCall: #(bool enigo_test())
]

{ #category : #'private - ffi' }
GtEnigoLibrary >> runner [ 

	^ ThreadedFFIMigration threadedFFIAvailable
		ifTrue: [ TFSameThreadRunner uniqueInstance ]
		ifFalse: [ super runner ]

]

{ #category : #'accessing platform' }
GtEnigoLibrary >> unixModuleName [
	^ self detectLibrary: 'libEnigo.so'
]

{ #category : #'accessing platform' }
GtEnigoLibrary >> win32ModuleName [
	^ self detectLibrary: 'libEnigo.dll'
]
