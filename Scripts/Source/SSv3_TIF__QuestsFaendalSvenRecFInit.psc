;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv3_TIF__QuestsFaendalSvenRecFInit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If akSpeaker == FaendalREF
   SSv2Quest.FaendalSex = 2
ElseIf akSpeaker == SvenREF
   SSv2Quest.SvenSex = 2
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ssv2questscript Property SSv2Quest  Auto  

Actor Property FaendalREF  Auto  

Actor Property SvenREF  Auto  
