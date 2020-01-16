Class {
	#name : #GtEnigoMouseButtonExamples,
	#superclass : #GtEnigoExternalEnumerationExamples,
	#category : #'GToolkit-Enigo-Examples'
}

{ #category : #examples }
GtEnigoMouseButtonExamples >> validateLayout [
	<gtExample>
	
	self assert: GtEnigoMouseButton definedLayout equals: GtEnigoMouseButton realLayout
]
