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
SongTest >> testFirstVerse [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	| actual expected |
	actual := Song new verse: 99.
	expected := String new writeStream
		nextPutAll: '99 bottles of beer on the wall, 99 bottles of beer'; cr;
		nextPutAll: 'Take one down and pass it around,'; cr;
		nextPutAll: '98 bottles of beer on the wall.'; cr;
		contents.
		
	self assert: actual equals: expected.
]
