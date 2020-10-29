Class {
	#name : #Song,
	#superclass : #Object,
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
Song >> verse: aNumber [
	"I return lyrics for the specified verse number."

	| replacementValues |
	replacementValues := Dictionary
		newFrom:
			{(#bottleNumber -> aNumber).
			(#nextBottleNumber -> (((aNumber - 1) = 1) ifTrue: ['one'] ifFalse: [aNumber - 1])).
			(#container -> 'bottles').
			(#nextContainer -> (((aNumber - 1) = 1) ifTrue: ['bottle'] ifFalse: ['bottles']))}.
	
	^ '{bottleNumber} {container} of beer on the wall, {bottleNumber} {container} of beer.
Take one down and pass it around, {nextBottleNumber} {nextContainer} of beer on the wall.
' format: replacementValues
]
