Class {
	#name : #BottleNumber,
	#superclass : #Object,
	#instVars : [
		'bottleNumber',
		'container'
	],
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
BottleNumber >> action [
	^ bottleNumber = 0
		ifTrue: [ 'Go to the store and buy some more' ] 
		ifFalse: [ 'Take {1} down and pass it around' format: { self pronoun }].
]

{ #category : #converting }
BottleNumber >> asString [ 
	^ '{1} {2}' format: { 
		(bottleNumber = 0) ifTrue: [ 'no more' ] ifFalse: bottleNumber .
		container } 
]

{ #category : #'as yet unclassified' }
BottleNumber >> nextBottle [
	^ self class new withNumber: (bottleNumber = 0 
		ifTrue: [99] 
		ifFalse: [bottleNumber - 1]).
]

{ #category : #'as yet unclassified' }
BottleNumber >> pronoun [
	^ (bottleNumber = 1) ifTrue: [ 'it' ] ifFalse: [ 'one' ].
]

{ #category : #'as yet unclassified' }
BottleNumber >> withNumber: aNumber [
	bottleNumber := aNumber.
	container := aNumber = 1 ifTrue: [ 'bottle' ] ifFalse: [ 'bottles' ]. 
	^ self
]
