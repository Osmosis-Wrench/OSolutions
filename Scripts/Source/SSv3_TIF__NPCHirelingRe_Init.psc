;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv3_TIF__NPCHirelingRe_Init Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv3_HirelingApproaching.SetValue(0)
SSv2NPCs.NPCHirelingRecurring = akSpeaker
SSv3Hireling.ForceRefTo(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ssv2npcscript Property SSv2NPCs  Auto  

ReferenceAlias Property SSv3Hireling  Auto  

GlobalVariable Property SSv3_HirelingApproaching  Auto  
