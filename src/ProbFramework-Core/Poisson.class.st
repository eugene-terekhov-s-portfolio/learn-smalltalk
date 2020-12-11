Class {
	#name : #Poisson,
	#superclass : #DiscreteProbability,
	#instVars : [
		'mu'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Poisson class >> mean: p [
	" p is the average number of events happening per unit interval."
	p > 0.0 
		ifTrue: [ ^ self new setMean: p ] 
		ifFalse: [ self error: 'mean must be > 0.0' ]
]

{ #category : #'probability functions' }
Poisson >> density: x [
 	"the probability than in a unit interval, x events will occur"
	x >= 0
		ifTrue: [ ^ ((mu raisedTo: x) * (mu negated exp)) / x factorial ] 
		ifFalse: [ ^ 0.0 ] 
]

{ #category : #accessing }
Poisson >> mean [ 
	^ mu
]

{ #category : #'random sampling' }
Poisson >> next [
	"how many events occur in the next time interval?"

	| p n q |
	p := mu negated exp.
	n := 0.
	q := 1.0.
	[ q := q * U next.
	q >= p ] whileTrue: [ n := n + 1 ].
	^ n
]

{ #category : #'private ' }
Poisson >> setMean: p [
	mu := p
]

{ #category : #accessing }
Poisson >> variance [
	^ mu
]
