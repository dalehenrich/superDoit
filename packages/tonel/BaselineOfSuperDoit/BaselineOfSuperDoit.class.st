Class {
	#name : 'BaselineOfSuperDoit',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSuperDoit'
}

{ #category : 'baseline' }
BaselineOfSuperDoit >> baseline: spec [
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'SuperDoit-Core';
        package: 'SuperDoit-Stone-Core'.
      spec
        group: 'default' with: #('SuperDoit-Core' 'SuperDoit-Stone-Core') ].
  spec
    for: #'gs3.6.x'
    do: [ 
      spec package: 'SuperDoit-GemStone-Kernel36x'.
      spec group: 'default' with: #( 'SuperDoit-GemStone-Kernel36x' ) ]

]

{ #category : 'accessing' }
BaselineOfSuperDoit >> project [
	^ super project
		loadType: #'atomic';
		yourself
]
