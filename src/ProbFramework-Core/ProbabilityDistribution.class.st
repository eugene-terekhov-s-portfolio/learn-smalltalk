"
Provides protocol for obtaining one or more random samplings from the distribution,
and for computing the density and cumulative distribution functions.
"
Class {
	#name : #ProbabilityDistribution,
	#superclass : #Stream,
	#classVars : [
		'U'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'class initialization' }
ProbabilityDistribution class >> initialize [
	"Uniformly distributed random numbers in the range [0, 1]"
	U := Random new
]

{ #category : #'instance creation' }
ProbabilityDistribution class >> new [ 
	^ self basicNew 
]

{ #category : #testing }
ProbabilityDistribution >> atEnd [
	"Answer whether the receiver can access any more objects."

	^ false
]

{ #category : #private }
ProbabilityDistribution >> computeSample: m outOf: n [
	"Compute the number of ways one can draw a sample without replacement of size m from a set of size n."

	m > n
		ifTrue: [ ^ 0.0 ].
	^ n factorial / (n - m) factorial
]

{ #category : #accessing }
ProbabilityDistribution >> contents [
	"Answer all of the contents of the receiver."

	self error: 'this is an infinite stream, cannot answer it''s contents'
]

{ #category : #'probability functions' }
ProbabilityDistribution >> density: x [
	"This is a density function."

	^ self subclassResponsibility
]

{ #category : #'probability functions' }
ProbabilityDistribution >> distribution: aCollection [
	"This is the cumulative distribution function. The argument is a range of contiguous values of the random variable. The distribution is mathematically the area under the probability curve within the specified interval."

	^ self subclassResponsibility
]

{ #category : #private }
ProbabilityDistribution >> inverseDistribution: x [

	^ self subclassResponsibility 
]

{ #category : #'random sampling' }
ProbabilityDistribution >> next [
	"This is a general random number generation method for any probability law; use the (0, 1) uniformly distributed random variable U as the value of the law's distribution function. Obtain the next random value and the solve for the inverse. The inverse solution is defined by the subclass."

	^ self inverseDistribution: U next
]

{ #category : #accessing }
ProbabilityDistribution >> nextPut: anObject [ 
	"Insert the argument, anObject, as the next object accessible by the 
	receiver. Answer anObject."
	
	self error: 'this is a read-only stream of generated values' 
]
