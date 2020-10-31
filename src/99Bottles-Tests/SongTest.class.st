Class {
	#name : #SongTest,
	#superclass : #TestCase,
	#classInstVars : [
		'testFirstVerse',
		'actual'
	],
	#category : #'99Bottles-Tests'
}

{ #category : #tests }
SongTest >> testAnotherVerse [	
	| actual expected |
	expected := 
'3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.
'.
	actual := Song new verse: 3.	
	self assert: actual equals: expected.
]

{ #category : #tests }
SongTest >> testFirstVerse [	
	| actual expected |
	expected := 
'99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.
'.
	actual := Song new verse: 99.	
	self assert: actual equals: expected.
]

{ #category : #tests }
SongTest >> testVerse2 [
	| actual expected |
	expected := 
'2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
'.
	actual := Song new verse: 2.	
	self assert: actual equals: expected.
]
