;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname ssv2_tif__02007140 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2.BanSex += 1
SSv2_ReparationsParticipantSpell.Cast(akSpeaker,akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ActorBase NPCBase = akSpeaker.GetActorBase()
if (NPCBase.GetSex() == 1)
    Handler.SexForTwo(akSpeaker, context="pleasuring", type="Fisting", allowLeadIn=false)
else
    Handler.SexForTwo(akSpeaker, context="pleasuring", type="Aggressive", allowLeadIn=false)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SSv2Follower  Auto  



SSv2QuestScript Property SSv2  Auto  

SPELL Property SSv2_ReparationsParticipantSpell  Auto  

SSv3Handler Property Handler  Auto  
