;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SSv3_TIF__NPCAnimalYesCreature Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv3AnimalSeller.ForceRefTo(akSpeaker)
SSv2NPC.NPCAnimalSeller = 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor creature

if akSpeaker == Banning && akSpeaker.IsInLocation(ReachHoldLocation)
	;dog
	creature = akSpeaker.GetLinkedRef() as Actor
ElseIf akSpeaker.IsInLocation(ReachHoldLocation)
	;markarth horse
	creature = Horse_Markarth.GetActorRef()
ElseIf akSpeaker.IsInLocation(WhiterunHoldLocation)
	;whiterun horse
	creature = Horse_Whiterun.GetActorRef()
ElseIf akSpeaker.IsInLocation(RiftHoldLocation)
	;riften horse
	creature = Horse_Riften.GetActorRef()
ElseIf akSpeaker.IsInLocation(HaafingarHoldLocation)
	;solitude horse
	creature = Horse_Solitude.GetActorRef()
ElseIf akSpeaker.IsInLocation(EastmarchHoldLocation)
	;windhelm horse
	creature = Horse_Windhelm.GetActorRef()
ElseIf akSpeaker.IsInLocation(DLC1HunterHQLocationInterior)
	;dawnguard troll
	Actor spawnedTroll = (DLC1DawnguardArmoredTrollSpawnMarker.PlaceAtMe(DLC1LvlTrollArmoredPlayerFollower)) As Actor
	Utility.Wait(1.0)
	SSv3AnimalTroll.ForceRefTo(spawnedTroll)
	creature = spawnedTroll
Else
	;SOMETHING BAD HAPPENED
	Debug.MessageBox("SexLab Solutions Error code 11 : Unexpected location for animal seller event")
EndIf
SSv3AnimalSellerApplaud.ForceRefTo(akSpeaker)
akSpeaker.EvaluatePackage()
Handler.CreatureSexForTwo(creature, victim = false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SSv3AnimalSeller  Auto  

ReferenceAlias Property Horse_Riften  Auto  

ReferenceAlias Property Horse_Whiterun  Auto  

ReferenceAlias Property Horse_Windhelm  Auto  

ReferenceAlias Property Horse_Markarth  Auto  

ReferenceAlias Property Horse_Solitude  Auto  

Actor Property Banning  Auto  

Location Property WhiterunHoldLocation  Auto  

Location Property RiftHoldLocation  Auto  

Location Property HaafingarHoldLocation  Auto  

Location Property ReachHoldLocation  Auto  

Location Property EastmarchHoldLocation  Auto  

SSv2NPCScript Property SSv2NPC  Auto  

Location Property DLC1HunterHQLocationInterior  Auto  

ObjectReference Property DLC1DawnguardArmoredTrollSpawnMarker  Auto  

ActorBase Property DLC1LvlTrollArmoredPlayerFollower  Auto  

ReferenceAlias Property SSv3AnimalTroll  Auto  

SSv3Handler Property Handler  Auto  

ReferenceAlias Property SSv3AnimalSellerApplaud  Auto  
