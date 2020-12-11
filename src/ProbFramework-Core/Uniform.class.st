Class {
	#name : #Uniform,
	#superclass : #ContinuousProbability,
	#instVars : [
		'startNumber',
		'stopNumber'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Uniform class >> from: begin to: end [ 
	begin > end 
		ifTrue: [ self error: 'illegal interval' ] 
		ifFalse: [ ^ self new setStart: begin toEnd: end ] 
]

{ #category : #'probability functions' }
Uniform >> density: x [
	(x between: startNumber and: stopNumber)
		ifTrue: [  ^ 1.0 / (stopNumber - startNumber) ]
		ifFalse: [  ^ 0 ]
]

{ #category : #private }
Uniform >> inverseDistribution: x [
	"x is a random number between o and 1"
	^ startNumber + (x * (stopNumber - startNumber))
]

{ #category : #accessing }
Uniform >> mean [ 

	^ (startNumber + stopNumber) / 2
]

{ #category : #private }
Uniform >> setStart: begin toEnd: end [
	startNumber := begin.
	stopNumber := end.
]

{ #category : #accessing }
Uniform >> variance [

	^ (stopNumber - startNumber) squared / 2
]
