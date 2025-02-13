"
A morph to grab borders of a `SpPaginatorSelectionMorph` and enlarge or contract its selection area.
Since it is designed to be contained in a specific morph (`SpPaginatorSelectionMorph`) and its morph it self is a part of a `SpPaginatorMorph`, it has some important assumptions: 

- the `SpPaginatorEdgeGripMorph>>#containerTarget` will be the owner of the target, and it limits  displacement of the selection morph.
- the target of the edge is the selection area always, and it can move (at least for the moment) just left or right.
"
Class {
	#name : #SpPaginatorEdgeGripMorph,
	#superclass : #EdgeGripMorph,
	#category : #'Spec2-Adapters-Morphic-Paginator'
}

{ #category : #accessing }
SpPaginatorEdgeGripMorph >> beLeft [

	self edgeName: #left
]

{ #category : #accessing }
SpPaginatorEdgeGripMorph >> beRight [

	self edgeName: #right
]

{ #category : #initialization }
SpPaginatorEdgeGripMorph >> initialize [

	super initialize. 
	self
		hResizing: #rigid;
		vResizing: #spaceFill
]

{ #category : #'event handling' }
SpPaginatorEdgeGripMorph >> mouseMove: anEvent [

	self target ifNil: [ ^ self ].
	(self target 
		canResizeTo: anEvent cursorPoint x 
		direction: self edgeName) 
		ifFalse: [ ^ self ].

	target ifNil: [^self].

	"We cannot delegate to the implementation in the superclass.
	The implementation of the superclass handles fast dragging. 
	In a paginator morph there is not such thing as fast dragging.
	Calling it breaks the paginator."
	
	lastMouse at: 1 put: anEvent cursorPoint.
	self targetPoint: lastMouse first - lastMouse last.
	self positionPoint: (lastMouse first - lastMouse second).
]

{ #category : #'event handling' }
SpPaginatorEdgeGripMorph >> mouseUp: anEvent [

	super mouseUp: anEvent.
	self owner mouseUp: anEvent
]

{ #category : #accessing }
SpPaginatorEdgeGripMorph >> positionPoint: aPoint [

	self position: (aPoint x) @ self top
]
