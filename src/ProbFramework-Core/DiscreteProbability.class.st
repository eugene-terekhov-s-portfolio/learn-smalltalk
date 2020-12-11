Class {
	#name : #DiscreteProbability,
	#superclass : #ProbabilityDistribution,
	#category : #'ProbFramework-Core'
}

{ #category : #'probability functions' }
DiscreteProbability >> distribution: aCollection [
	"Answer the sum of the discrete values of the density function for each element in the collection."

	| t |
	t := 0.0.
	aCollection do: [ :i | t := t + (self density: i) ].
	^ t
]
