Extension { #name : #SpMorphicWindowAdapter }

{ #category : #'*Spec2-Morphic-Backend-Tests' }
SpMorphicWindowAdapter >> windowIsResizable [

	^ widget isResizeable
]

{ #category : #'*Spec2-Morphic-Backend-Tests' }
SpMorphicWindowAdapter >> windowSize [

	^ widget extent
]
