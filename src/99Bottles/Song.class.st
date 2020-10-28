Class {
	#name : #Song,
	#superclass : #Object,
	#category : #'99Bottles'
}

{ #category : #'as yet unclassified' }
Song >> verse: aNumber [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	^ String new writeStream 
		nextPutAll: '99 bottles of beer on the wall, 99 bottles of beer';	cr;
		nextPutAll: 'Take one down and pass it around,'; 	cr;
		nextPutAll: '98 bottles of beer on the wall.'; cr;
	  contents. 
]
