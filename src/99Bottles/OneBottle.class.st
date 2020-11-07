Class {
	#name : #OneBottle,
	#superclass : #BottleNumber,
	#category : #'99Bottles'
}

{ #category : #converting }
OneBottle >> asString [ 
	^ '1 bottle'. 
]

{ #category : #'as yet unclassified' }
OneBottle >> nextBottle [
	^ ZeroBottle new
]

{ #category : #'as yet unclassified' }
OneBottle >> pronoun [
	^ 'it'.
]
