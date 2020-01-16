Class {
	#name : #GtEnigoMouseButton,
	#superclass : #GtEnigoExternalEnumeration,
	#classVars : [
		'Left',
		'Middle',
		'Right',
		'ScrollDown',
		'ScrollLeft',
		'ScrollRight',
		'ScrollUp'
	],
	#category : #'GToolkit-Enigo-Enums'
}

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> Left [
	"This method was automatically generated"
	^ Left
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> Middle [
	"This method was automatically generated"
	^ Middle
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> Right [
	"This method was automatically generated"
	^ Right
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> ScrollDown [
	"This method was automatically generated"
	^ ScrollDown
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> ScrollLeft [
	"This method was automatically generated"
	^ ScrollLeft
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> ScrollRight [
	"This method was automatically generated"
	^ ScrollRight
]

{ #category : #'accessing enum' }
GtEnigoMouseButton class >> ScrollUp [
	"This method was automatically generated"
	^ ScrollUp
]

{ #category : #'enum declaration' }
GtEnigoMouseButton class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Left,
		Middle,
		Right,
		ScrollUp,
		ScrollDown,
		ScrollLeft,
		ScrollRight,
	)
]

{ #category : #accessing }
GtEnigoMouseButton class >> externalType [
	^ FFIUInt32 new
]

{ #category : #'class initialization' }
GtEnigoMouseButton class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
GtEnigoMouseButton >> primRealName: aBoxerString [
	^ self ffiCall: #(void enigo_mouse_button_to_string(self, GtBoxerString aBoxerString))
]
