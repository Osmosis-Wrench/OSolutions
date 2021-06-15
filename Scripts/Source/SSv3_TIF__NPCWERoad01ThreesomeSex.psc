;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SSv3_TIF__NPCWERoad01ThreesomeSex Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Handler.SexForThree(Farmer1.GetActorRef(), Farmer2.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
WERoad01.SetStage(20)
Game.GetPlayer().RemoveItem(Gold001, 45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WERoad01  Auto  

MiscObject Property Gold001  Auto  

SSv3Handler Property Handler  Auto  

ReferenceAlias Property Farmer1  Auto  

ReferenceAlias Property Farmer2  Auto  
