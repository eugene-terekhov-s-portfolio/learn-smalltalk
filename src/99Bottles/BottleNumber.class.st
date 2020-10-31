Class {
	#name : #BottleNumber,
	#superclass : #Object,
	#instVars : [
		'bottleNumber',
		'container'
	],
	#category : #'99Bottles'
}

{ #category : #converting }
BottleNumber >> asString [ 
	^ '{1} {2}' format: { 
		(bottleNumber = 0) ifTrue: [ 'no more' ] ifFalse: bottleNumber .
		container } 
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
