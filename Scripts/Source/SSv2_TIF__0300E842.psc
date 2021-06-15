;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SSv2_TIF__0300E842 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2NPC.NPCWE17BanditToll = 1
Game.GetPlayer().AddItem(Gold001, 100, false)
Utility.Wait(0.5)
WE17.setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Handler.SexForTwo(akSpeaker, context="pleasuring", type="Any", aggressive=true, allowLeadIn=false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SSv2NPCScript Property SSv2NPC  Auto  

Quest Property WE17  Auto  

MiscObject Property Gold001  Auto  

SSv3Handler Property Handler  Auto  
