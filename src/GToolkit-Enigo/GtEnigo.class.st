Class {
	#name : #GtEnigo,
	#superclass : #GtBoxerValueBox,
	#classInstVars : [
		'default',
		'session'
	],
	#category : #'GToolkit-Enigo-Core'
}

{ #category : #accessing }
GtEnigo class >> default [
	^ (session == Smalltalk session
		and: [ default isNotNil and: [ default isNull not ] ])
			ifTrue: [ default ]
			ifFalse: [
				session := Smalltalk session.
				default := self new ]
]

{ #category : #'library path' }
GtEnigo class >> ffiLibraryName [
	^ GtEnigoLibrary
]

{ #category : #'private - ffi' }
GtEnigo class >> primCreate [
	^ self ffiCall: #(void* enigo_new())
]

{ #category : #'private - ffi' }
GtEnigo class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void enigo_drop(void* aHandle))
]

{ #category : #'api - scroll' }
GtEnigo >> horizontalMouseScroll: aLength [
	self primMouseScrollX: aLength
	
]

{ #category : #'api - mouse click' }
GtEnigo >> leftMouseClick [
	self mouseClick: GtEnigoMouseButton Left
]

{ #category : #'api - mouse down' }
GtEnigo >> leftMouseDown [
	self mouseDown: GtEnigoMouseButton Left
]

{ #category : #'api - mouse up' }
GtEnigo >> leftMouseUp [
	self mouseUp: GtEnigoMouseButton Left
]

{ #category : #'api - mouse click' }
GtEnigo >> middleMouseClick [
	self mouseClick: GtEnigoMouseButton Middle
]

{ #category : #'api - mouse down' }
GtEnigo >> middleMouseDown [
	self mouseDown: GtEnigoMouseButton Middle
]

{ #category : #'api - mouse up' }
GtEnigo >> middleMouseUp [
	self mouseUp: GtEnigoMouseButton Middle
]

{ #category : #'api - mouse click' }
GtEnigo >> mouseClick: aGtEnigoMouseButton [
	self primMouseClick: aGtEnigoMouseButton
]

{ #category : #'api - mouse down' }
GtEnigo >> mouseDown: aGtEnigoMouseButton [
	self primMouseDown: aGtEnigoMouseButton
]

{ #category : #'api - mouse move' }
GtEnigo >> mouseMoveRelative: aPoint [
	self
		primMouseMoveRelativeX: aPoint x
		Y: aPoint y
]

{ #category : #'api - mouse move' }
GtEnigo >> mouseMoveTo: aPoint [
	self
		primMouseMoveToX: aPoint x
		Y: aPoint y
]

{ #category : #'api - scroll' }
GtEnigo >> mouseScroll: aPoint [
	self verticalMouseScroll: aPoint y.
	self horizontalMouseScroll: aPoint x
]

{ #category : #'api - mouse up' }
GtEnigo >> mouseUp: aGtEnigoMouseButton [
	self primMouseUp: aGtEnigoMouseButton
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseClick: aGtEnigoMouseButton [
	self ffiCall: #(void enigo_mouse_click(self, GtEnigoMouseButton aGtEnigoMouseButton))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseDown: aGtEnigoMouseButton [
	self ffiCall: #(void enigo_mouse_down(self, GtEnigoMouseButton aGtEnigoMouseButton))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseMoveRelativeX: aX Y: aY [
	self ffiCall: #(void enigo_mouse_move_relative(self, int32 aX, int32 aY))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseMoveToX: aX Y: aY [
	self ffiCall: #(void enigo_mouse_move_to(self, int32 aX, int32 aY))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseScrollX: aLength [
	self ffiCall: #(void enigo_mouse_mouse_scroll_x(self, int32 aLength))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseScrollY: aLength [
	self ffiCall: #(void enigo_mouse_mouse_scroll_y(self, int32 aLength))
]

{ #category : #'private - ffi' }
GtEnigo >> primMouseUp: aGtEnigoMouseButton [
	self ffiCall: #(void enigo_mouse_up(self, GtEnigoMouseButton aGtEnigoMouseButton))
]

{ #category : #'api - mouse click' }
GtEnigo >> rightMouseClick [
	self mouseClick: GtEnigoMouseButton Right
]

{ #category : #'api - mouse down' }
GtEnigo >> rightMouseDown [
	self mouseDown: GtEnigoMouseButton Right
]

{ #category : #'api - mouse up' }
GtEnigo >> rightMouseUp [
	self mouseUp: GtEnigoMouseButton Right
]

{ #category : #'api - scroll' }
GtEnigo >> verticalMouseScroll: aLength [
	self primMouseScrollY: aLength
	
]
