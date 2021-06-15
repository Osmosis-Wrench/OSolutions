;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SSv3_TIF__NPCWERoad01OtherSex Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor sexActor
If akSpeaker == Farmer2.GetActorRef()
   sexActor = Farmer1.GetActorRef()
Else
   sexActor = Farmer2.GetActorRef()
EndIf
Handler.SexForTwo(sexActor, context="pleasured", type="Any")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
WERoad01.SetStage(20)
Game.GetPlayer().RemoveItem(Gold001, 20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

SSv3Handler Property Handler  Auto  

Quest Property WERoad01  Auto  

ReferenceAlias Property Farmer1  Auto  

ReferenceAlias Property Farmer2  Auto  
