;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SSv3_TIF__BlockingAnimalSellerReward Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;give player ownership of animal
if akSpeaker == Banning && akSpeaker.IsInLocation(ReachHoldLocation)
	;dog
	akSpeaker.GetLinkedRef().SetActorOwner(Game.GetPlayer().GetActorBase())
	(pDialogueFollower as DialogueFollowerScript).SetAnimal(akSpeaker.GetLinkedRef())
ElseIf akSpeaker.IsInLocation(ReachHoldLocation)
	;markarth horse
	Horse_Markarth.GetActorRef().SetFactionRank(PlayerHorseFaction, 1)
	Horse_Markarth.GetActorRef().SetFactionOwner(PlayerFaction)
	PlayersHorse.ForceRefTo(Horse_Markarth.GetActorRef())
	Game.IncrementStat( "Horses Owned" )

ElseIf akSpeaker.IsInLocation(WhiterunHoldLocation)
	;whiterun horse
	Horse_Whiterun.GetActorRef().SetFactionRank(PlayerHorseFaction, 1)
	Horse_Whiterun.GetActorRef().SetFactionOwner(PlayerFaction)
	PlayersHorse.ForceRefTo(Horse_Whiterun.GetActorRef())
	Game.IncrementStat( "Horses Owned" )

ElseIf akSpeaker.IsInLocation(RiftHoldLocation)
	;riften horse
	Horse_Riften.GetActorRef().SetFactionRank(PlayerHorseFaction, 1)
	Horse_Riften.GetActorRef().SetFactionOwner(PlayerFaction)
	PlayersHorse.ForceRefTo(Horse_Riften.GetActorRef())
	Game.IncrementStat( "Horses Owned" )

ElseIf akSpeaker.IsInLocation(HaafingarHoldLocation)
	;solitude horse
	Horse_Solitude.GetActorRef().SetFactionRank(PlayerHorseFaction, 1)
	Horse_Solitude.GetActorRef().SetFactionOwner(PlayerFaction)
	PlayersHorse.ForceRefTo(Horse_Solitude.GetActorRef())
	Game.IncrementStat( "Horses Owned" )

ElseIf akSpeaker.IsInLocation(EastmarchHoldLocation)
	;windhelm horse
	Horse_Windhelm.GetActorRef().SetFactionRank(PlayerHorseFaction, 1)
	Horse_Windhelm.GetActorRef().SetFactionOwner(PlayerFaction)
	PlayersHorse.ForceRefTo(Horse_Windhelm.GetActorRef())
	Game.IncrementStat( "Horses Owned" )
ElseIf akSpeaker.IsInLocation(DLC1HunterHQLocationInterior)
	If (SSv3AnimalTroll.GetActorRef() == None)
		DLC1Radiant_Script.MakeTrollFollower(None, ChargePlayer = false)
	Else
		DLC1Radiant_Script.MakeTrollFollower(SSv3AnimalTroll.GetActorRef(), ChargePlayer = false)
		SSv3AnimalTroll.Clear()
	EndIf
Else
	;SOMETHING BAD HAPPENED
	Debug.MessageBox("SexLab Solutions Error code 10 : Unexpected location for horse/dog event")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv3AnimalSeller.Clear()
SSv3AnimalSellerApplaud.Clear()
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SSv3AnimalSeller  Auto  

ReferenceAlias Property PlayersHorse  Auto  

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

Quest Property pDialogueFollower  Auto  

Faction Property PlayerFaction  Auto  

Faction Property PlayerHorseFaction  Auto  

Location Property DLC1HunterHQLocationInterior  Auto  

ReferenceAlias Property SSv3AnimalTroll  Auto  

dlc1radiantscript Property DLC1Radiant_Script  Auto  

ReferenceAlias Property SSv3AnimalSellerApplaud  Auto  
