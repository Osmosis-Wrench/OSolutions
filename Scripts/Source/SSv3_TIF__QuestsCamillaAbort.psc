;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SSv3_TIF__QuestsCamillaAbort Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
FaendalREF.SetRelationshipRank(Game.GetPlayer(), -1)
SvenREF.SetRelationshipRank(Game.GetPlayer(), -1)
akSpeaker.SetRelationshipRank(FaendalREF, -1)
akSpeaker.SetRelationshipRank(SvenREF, -1)
akSpeaker.SetRelationshipRank(Game.GetPlayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().additem(Gold001, 50, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Quest Property FreeformRiverwood01  Auto  

Actor Property FaendalREF  Auto  

Actor Property SvenREF  Auto  
