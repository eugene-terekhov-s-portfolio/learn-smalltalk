Class {
	#name : #ZeroBottle,
	#superclass : #BottleNumber,
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
ZeroBottle >> action [ 
	^ 'Go to the store and buy some more'
]

{ #category : #converting }
ZeroBottle >> asString [
	^ 'no more bottles'
]

{ #category : #'as yet unclassified' }
ZeroBottle >> nextBottle [
	^ BottleNumber new withNumber: 99
]
