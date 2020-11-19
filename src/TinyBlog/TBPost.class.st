"
I represent a single blog post.

Instance Variables:
	category:		<Object> - category of the post
	date:		<Object> - date of writing
	text:		<Object> - post text
	title:		<Object> - post title
	visible:		<Object> - is the post publicly visible (published) or not
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'TinyBlog-Core'
}

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText [
	"Creates a minimalistic blog post"
	
	^ self new 
		title: aTitle;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText category: aCategory [
	"Creates a minimalistic blog post with category specified"
	
	^ (self title: aTitle text: aText) 
		category: aCategory;
		yourself
]

{ #category : #initialization }
TBPost class >> unclassifiedTag [
	"Returns the tag name for yet unclassified blog posts. It is similar to public constant."
	^ 'Unclassified'
]

{ #category : #action }
TBPost >> beVisible [ 
	"Post becomes published, i.e. publicly visible"
	self visible: true
]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: anObject [
	date := anObject
]

{ #category : #initialization }
TBPost >> initialize [
	super initialize.
	self category: TBPost unclassifiedTag.
	self date: Date today.
	self notVisible.
]

{ #category : #action }
TBPost >> notVisible [ 
	"Post becomes unpublished, i.e. not publicly visible"
	self visible: false
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TBPost >> title [
	^ title
]

{ #category : #accessing }
TBPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: anObject [
	visible := anObject
]
