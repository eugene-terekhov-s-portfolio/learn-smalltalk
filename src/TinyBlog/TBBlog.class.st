Class {
	#name : #TBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TinyBlog-Core'
}

{ #category : #accessing }
TBBlog class >> current [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ].
]

{ #category : #'class initialization' }
TBBlog class >> initialize [ 
	self reset
]

{ #category : #initialization }
TBBlog class >> reset [ 
	uniqueInstance := nil.
]

{ #category : #accessing }
TBBlog >> allBlogPosts [
	^ posts.
]

{ #category : #accessing }
TBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p | p isVisible ]
]

{ #category : #actions }
TBBlog >> removeAllPosts [
	posts := OrderedCollection new.
]

{ #category : #accessing }
TBBlog >> size [
	^ posts size.
]

{ #category : #actions }
TBBlog >> writeBlogPost: aTBPost [ 
	posts add: aTBPost.
]
