;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname ssv2_tif__03003429 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2.DCFuck = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor Drunk1 = Drunk01.GetActorReference()
Actor Drunk2 = Drunk02.GetActorReference()
Handler.SexForThree(Drunk1, Drunk2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SSv2QScript Property SSv2  Auto  



ReferenceAlias Property Drunk01  Auto  

ReferenceAlias Property Drunk02  Auto  

SSv3Handler Property Handler  Auto  
