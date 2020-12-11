Class {
	#name : #Normal,
	#superclass : #ContinuousProbability,
	#instVars : [
		'mu',
		'sigma'
	],
	#category : #'ProbFramework-Core'
}

{ #category : #'instance creation' }
Normal class >> mean: a deviation: b [
	b > 0.0
		ifTrue: [ ^ self new setMean: a standardDeviation: b ]
		ifFalse: [ ^ self error: 'standard deviation must be greater than 0' ]
]

{ #category : #'probability functions' }
Normal >> density: x [
	
	| twoPi t |
	twoPi := 2 * 3.1415926536.
	t := x - mu / sigma.
	^ (-0.5 * t squared) exp / (sigma * twoPi sqrt)
]

{ #category : #accessing }
Normal >> mean [ 
	^ mu
]

{ #category : #'random sampling' }
Normal >> next [
	"Polar method for normal deviates, Knuth vol.2, pp. 104, 113"

	| v1 v2 s rand u |
	rand := Uniform from: -1.0 to: 1.0.
	[ v1 := rand next.
	v2 := rand next.
	s := v1 squared + v2 squared.
	s >= 1 ] whileTrue.
	u := (-2.0 * s ln / s) sqrt.
	^ mu + (sigma * v1 * u)
]

{ #category : #private }
Normal >> setMean: m standardDeviation: s [
	mu := m.
	sigma := s
]

{ #category : #accessing }
Normal >> variance [
	^ sigma squared
]
