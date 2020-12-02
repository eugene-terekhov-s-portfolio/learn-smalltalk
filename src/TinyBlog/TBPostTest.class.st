Class {
	#name : #TBPostTest,
	#superclass : #TestCase,
	#category : #'TinyBlog-Tests'
}

{ #category : #tests }
TBPostTest >> testWithoutCategoryIsUnclassified [
	
	| post |
	post := TBPost title: 'Sample blog post' text: 'Sample blog post contents.'.
	
	self assert: post title equals: 'Sample blog post'.
	self assert: post text equals: 'Sample blog post contents.'.
	self assert: post isUnclassified.
	self deny: post isVisible.
]
