;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname ssv2_tif__0200713c Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2FollowerQuests.Clear()
SSv2.BanSex += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2_ReparationsParticipantSpell.Cast(akSpeaker,akSpeaker)
string differentiatedType = "Any"
if (akSpeaker.GetLeveledActorBase().GetSex() == 1)
    differentiatedType = "Fisting"
endif
Handler.SexForTwo(partner = akSpeaker, type = differentiatedType, victim = 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



SSv2QuestScript Property SSv2  Auto  

SPELL Property SSv2_ReparationsParticipantSpell  Auto  

ReferenceAlias Property SSv2FollowerQuests  Auto  

SSv3Handler Property Handler  Auto  
