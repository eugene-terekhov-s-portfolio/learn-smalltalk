Class {
	#name : #Geometric,
	#superclass : #Bernoulli,
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Geometric class >> mean: m [
	"Note that the message parameter: is implemented in the superclass"
	^ self parameter: m
]

{ #category : #'probability functions' }
Geometric >> density: x [
	x > 0
		ifTrue: [ ^ prob * (1.0 - prob raisedTo: x - 1) ]
		ifFalse: [ ^ 0.0 ]
]

{ #category : #private }
Geometric >> inverseDistribution: x [
	"Method is from Knuth, Vol. 2, pp.116-117"

	^ (x ln / (1.0 - prob) ln) ceiling
]

{ #category : #accessing }
Geometric >> mean [
	^ 1.0 / prob
]

{ #category : #accessing }
Geometric >> variance [
	^ (1.0 - prob) / prob squared 
]
