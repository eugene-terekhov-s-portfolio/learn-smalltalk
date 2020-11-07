Class {
	#name : #BottleNumber,
	#superclass : #Object,
	#instVars : [
		'bottleNumber'
	],
	#category : #'99Bottles'
}

{ #category : #'instance creation' }
BottleNumber class >> new: aNumber [
	^ aNumber = 1
		ifTrue: [ OneBottle new ]
		ifFalse: [ aNumber = 0
				ifTrue: [ ZeroBottle new ]
				ifFalse: [ BottleNumber new withNumber: aNumber ] ]
]

{ #category : #'as yet unclassified' }
BottleNumber >> action [
	^ 'Take {1} down and pass it around' format: { self pronoun }
]

{ #category : #converting }
BottleNumber >> asString [
	^ '{1} bottles' format: {bottleNumber}
]

{ #category : #'as yet unclassified' }
BottleNumber >> nextBottle [
	^ self class new: bottleNumber - 1
]

{ #category : #'as yet unclassified' }
BottleNumber >> pronoun [
	^ 'one'.
]

{ #category : #'as yet unclassified' }
BottleNumber >> withNumber: aNumber [
	bottleNumber := aNumber.
	^ self
]
