Class {
	#name : #Exponential,
	#superclass : #ContinuousProbability,
	#instVars : [
		'mu'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Exponential class >> mean: p [
	"Since the exponential parameter mu is the same as Poisson mu, if we are given the mean of the exponential, we take reciprocal to get the probability parameter."
	^ self parameter: 1.0/p
]

{ #category : #'instance creation' }
Exponential class >> parameter: p [
	p > 0.0
		ifTrue: [ ^self new setParameter: p ]
		ifFalse: [ self error: 'The probability parameter must be greater than 0.0' ]
]

{ #category : #'probability functions' }
Exponential >> density: x [
	x > 0.0
		ifTrue: [ ^ mu * (mu * x) negated exp ]
		ifFalse: [ ^ 0.0 ]
]

{ #category : #'probability functions' }
Exponential >> distribution: anInterval [
	anInterval stop <= 0.0
		ifTrue: [ ^ 0.0 ]
		ifFalse: [ ^ 1.0 - (mu * anInterval stop) negated exp	-
					(anInterval start > 0.0
						ifTrue: [ self distribution: (0.0 to: anInterval start) ]
						ifFalse: [ 0.0 ]) ]
]

{ #category : #private }
Exponential >> inverseDistribution: x [
	"Implementation according to Knuth, vol.2, p.114"
	^ x ln negated / mu
]

{ #category : #accessing }
Exponential >> mean [ 
	^1.0 / mu
]

{ #category : #private }
Exponential >> setParameter: p [
	mu := p
]

{ #category : #accessing }
Exponential >> variance [
	^1.0 / (mu * mu)
]
