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
	^ '{1} of beer on the wall, {1} of beer.
Take {3} down and pass it around, {2} of beer on the wall.
'
		format:
			{bottle asString .
			(BottleNumber new withNumber: aNumber - 1) asString .
			bottle pronoun}
]
