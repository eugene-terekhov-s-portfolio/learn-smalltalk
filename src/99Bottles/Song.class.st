Class {
	#name : #Song,
	#superclass : #Object,
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
Song >> verse: aNumber [
	"I return lyrics for the specified verse number."

	^ '{1} of beer on the wall, {1} of beer.
Take one down and pass it around, {2} of beer on the wall.
' format: {
		(BottleNumber new withNumber: aNumber) asString . 
		(BottleNumber new withNumber: aNumber - 1) asString
	}
]
