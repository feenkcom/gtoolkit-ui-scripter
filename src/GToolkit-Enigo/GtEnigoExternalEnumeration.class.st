Class {
	#name : #GtEnigoExternalEnumeration,
	#superclass : #FFIExternalEnumeration,
	#category : #'GToolkit-Enigo-Enums'
}

{ #category : #accessing }
GtEnigoExternalEnumeration class >> definedLayout [
	<return: #Dictionary>

	^ (self variants collect: [ :eachVariant | eachVariant item -> eachVariant value ]) asOrderedDictionary
]

{ #category : #'enum declaration' }
GtEnigoExternalEnumeration class >> enumDecl [
	| declaration index |
	"
	self rebuildEnumAccessors
	"

	self = GtEnigoExternalEnumeration
		ifTrue: [ ^ #() ].
		
	index := -1.
	declaration := self externalDeclaration.
	
	self
		assert: [ declaration last = #, ]
		description: [ 'Declaration must end with comma!' ].
	
	^ (declaration pairsCollect: [ :aName :aComma |  index := index + 1. { aName . index } ]) flattened
]

{ #category : #'enum declaration' }
GtEnigoExternalEnumeration class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ self subclassResponsibility
]

{ #category : #accessing }
GtEnigoExternalEnumeration class >> externalType [
	^ self subclassResponsibility
]

{ #category : #'library path' }
GtEnigoExternalEnumeration class >> ffiLibraryName [
	^ GtEnigoLibrary
]

{ #category : #'gt-extension' }
GtEnigoExternalEnumeration class >> gtDefinedLayoutFor: aView [
	<gtView>
	
	^ (self definedLayout gtItemsFor: aView)
		title: 'Defined layout';
		priority: 2
]

{ #category : #'gt-extension' }
GtEnigoExternalEnumeration class >> gtRealLayoutFor: aView [
	<gtView>
	
	^ (self realLayout gtItemsFor: aView)
		title: 'Real layout';
		priority: 3
]

{ #category : #'class initialization' }
GtEnigoExternalEnumeration class >> initialize [
	
	"Skip initialization of root class"
	self = GtEnigoExternalEnumeration
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.
	
	Author
		useAuthor: 'UFFI'
		during: [ self rebuildEnumAccessors ]
]

{ #category : #accessing }
GtEnigoExternalEnumeration class >> realLayout [
	<return: #Dictionary>

	^ (self variants collect: [ :eachVariant | eachVariant realItem -> eachVariant value ]) asOrderedDictionary
]

{ #category : #private }
GtEnigoExternalEnumeration class >> rebuildEnumAccessors [

	"Skip initialization of root class"
	self = GtEnigoExternalEnumeration
		ifTrue: [ ^ self ].

	self initializeEnumeration.
	representationType := self externalType.

	super rebuildEnumAccessors.
]

{ #category : #accessing }
GtEnigoExternalEnumeration class >> variants [
	<return: #SkiaExternalEnumeration>

	^ self classPool values sorted: [ :a :b | a value < b value ]
]

{ #category : #'library path' }
GtEnigoExternalEnumeration >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'private - ffi' }
GtEnigoExternalEnumeration >> primRealName: aBoxerString [
	"
	^ self ffiCall: #(void enigo_type_to_string(self, GtBoxerString aBoxerString))
	"

	^ self subclassResponsibility
]

{ #category : #accessing }
GtEnigoExternalEnumeration >> realItem [
	<return: #Symbol>

	^ (GtBoxerString getStringFrom: [ :aBoxerString | self primRealName: aBoxerString ]) asSymbol
]
