Class {
	#name : #Gamma,
	#superclass : #Exponential,
	#instVars : [
		'N'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Gamma class >> events: k mean: p [

	| kTrunc |
	kTrunc := k truncated.
	kTrunc > 0
		ifTrue: [ ^ (self parameter: kTrunc / p) setEvents: kTrunc ]
		ifFalse: [ self error: 'the number of events must be greater than 0' ]
]

{ #category : #'probability functions' }
Gamma >> density: x [
	| t |
	x > 0.0
		ifTrue: [ t := mu * x.
			^ (mu raisedTo: N) / (self gamma: N) * (x raisedTo: N - 1)	* t negated exp ]
		ifFalse: [ ^ 0.0 ]
]

{ #category : #private }
Gamma >> gamma: n [

	| t |
	t := n - 1.0.
	^ self computeSample: t outOf: t 
]

{ #category : #accessing }
Gamma >> mean [

	^ super mean * N
]

{ #category : #private }
Gamma >> setEvents: events [ 
	N := events
]

{ #category : #accessing }
Gamma >> variance [

	^ super variance * N
]
