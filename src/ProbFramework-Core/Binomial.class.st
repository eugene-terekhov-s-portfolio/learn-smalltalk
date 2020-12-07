Class {
	#name : #Binomial,
	#superclass : #Bernoulli,
	#instVars : [
		'N'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Binomial class >> events: n mean: m [

	n truncated <= 0 ifTrue: [ self error: 'number of events should be > 0' ].
	^ self new events: n mean: m
]

{ #category : #'probability functions' }
Binomial >> density: x [
	(x between: 0 and: N)
		ifTrue: [ ^ ((self computeSample: x outOf: N)
			/ (self computeSample: x outOf: x))
				* (prob raisedTo: x) * ((1.0 - prob) raisedTo: N - x)] 
		ifFalse: [ ^ 0.0 ]
]

{ #category : #'instance creation' }
Binomial >> events: n mean: m [
	N := n truncated.
	self setParameter: m/N.
	"setParameter: is implemented in a superclass" 
]

{ #category : #'random sampling' }
Binomial >> next [ 
	| t |
	"A surefire but slow method is to sample a Bernoulli N times. Since the Bernoulli returns 0 or 1, the sum will be between 0 and N."
	t := 0.
	N timesRepeat: [ t := t + super next ].
	^ t
]
