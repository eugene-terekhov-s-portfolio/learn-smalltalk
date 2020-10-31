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
	^ '{1} {2}' format: { bottleNumber . container }
]

{ #category : #'as yet unclassified' }
BottleNumber >> withNumber: aNumber [
	bottleNumber := aNumber.
	container := aNumber = 1 ifTrue: [ 'bottle' ] ifFalse: [ 'bottles' ]. 
	^ self
]
