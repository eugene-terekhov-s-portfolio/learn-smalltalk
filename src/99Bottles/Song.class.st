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
			(#nextBottleNumber -> (aNumber - 1))}.
	
	^ '{bottleNumber} bottles of beer on the wall, {bottleNumber} bottles of beer.
Take one down and pass it around, {nextBottleNumber} bottles of beer on the wall.
' format: replacementValues
]
