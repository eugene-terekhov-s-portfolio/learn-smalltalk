Class {
	#name : #Song,
	#superclass : #Object,
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
Song >> verse: aNumber [
	"I return lyrics for the specified verse number."

	| bottle |
	bottle := BottleNumber new withNumber: aNumber.
	^ '{1} of beer on the wall, {2} of beer.
{3}, {4} of beer on the wall.
'
		format:
			{bottle asString capitalized .
			bottle asString .
			bottle action . 
			bottle nextBottle asString . }
]

{ #category : #'as yet unclassified' }
Song >> verseFrom: fromVerse to: toVerse [ 
	| output | 
	output := String new writeStream.
	(Interval from: toVerse to: fromVerse) reverse do: [ :each | output nextPutAll: (self verse: each) ].
	^ output contents .
]
