Class {
	#name : #Bernoulli,
	#superclass : #DiscreteProbability,
	#instVars : [
		'prob'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Bernoulli class >> parameter: aNumber [
	(aNumber between: 0.0 and: 1.0)
		ifTrue: [ ^ self new setParameter: aNumber ]
		ifFalse: [ self error: 'The probability must be between 0.0 and 1.0' ]
]

{ #category : #'probability functions' }
Bernoulli >> density: x [

	"let 1 denote success"
	x = 1
		ifTrue: [ ^ prob ].

	"let 0 denote failure"
	x = 0
		ifTrue: [ ^ 1.0 - prob ].

	self error: 'outcomes of a Bernoulli can only be 1 or 0'
]

{ #category : #private }
Bernoulli >> inverseDistribution: x [
	"Depending on the random variable x, the random sample is 1 or 0, denoting success or failure of the Bernoulli trial."

	x <= prob
		ifTrue: [ ^ 1 ]
		ifFalse: [ ^ 0 ]
]

{ #category : #accessing }
Bernoulli >> mean [
	^ prob
]

{ #category : #private }
Bernoulli >> setParameter: aNumber [
	prob := aNumber
]

{ #category : #accessing }
Bernoulli >> variance [
	^ prob * (1.0 - prob)
]
