;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv3_TIF__CR04AttachAliases Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv3Quests_CR04Opponent.ForceRefTo(CR04Opponent.GetActorRef())
SSv3System_CR04Opponent.ForceRefTo(CR04Opponent.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SSv3Quests_CR04Opponent  Auto  

ReferenceAlias Property SSv3System_CR04Opponent  Auto  

ReferenceAlias Property CR04Opponent  Auto  
