Class {
	#name : #TBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first'
	],
	#category : #'TinyBlog-Tests'
}

{ #category : #running }
TBBlogTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	blog := TBBlog current.
	blog removeAllPosts.
	
	first := TBPost title: 'A Title' text: 'A Text' category: 'A Category'.
	blog writeBlogPost: first. 
	
	post := (TBPost title: 'Another Title' text: 'Another Text' category: 'Another Category') beVisible.
]

{ #category : #running }
TBBlogTest >> tearDown [ 
	TBBlog reset.
]

{ #category : #tests }
TBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2.
]

{ #category : #tests }
TBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2.
]

{ #category : #tests }
TBBlogTest >> testRemoveAllPosts [
	blog removeAllPosts .
	self assert: blog size equals: 0
]

{ #category : #tests }
TBBlogTest >> testSize [ 
	self assert: blog size equals: 1
]

{ #category : #tests }
TBBlogTest >> testVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1.
]
