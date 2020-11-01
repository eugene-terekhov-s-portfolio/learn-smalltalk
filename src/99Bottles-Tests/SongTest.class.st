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
SongTest >> testACoupleVerses [

	| actual expected |
	expected := 
'99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.
98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.
'.
	actual := Song new verseFrom: 99 to: 98.	
	self assert: actual equals: expected.
]

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
SongTest >> testLastVerses [

	| actual expected |
	expected := 
'2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
'.
	actual := Song new verseFrom: 2 to: 0.	
	self assert: actual equals: expected.
]

{ #category : #tests }
SongTest >> testVerse0 [
	| actual expected |
	expected := 
'No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
'.
	actual := Song new verse: 0.	
	self assert: actual equals: expected.
]

{ #category : #tests }
SongTest >> testVerse1 [
	| actual expected |
	expected := 
'1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
'.
	actual := Song new verse: 1.	
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
