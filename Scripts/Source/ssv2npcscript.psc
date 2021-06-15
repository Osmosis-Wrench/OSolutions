Scriptname SSv2NPCScript extends Quest Conditional

SSv3Config Property SSv3MCM  Auto  
SSv3Handler Property Handler  Auto  
Actor Property PlayerRef  Auto  
Quest property DialogueRiftenGateGuards auto
Quest property DialogueWhiterunGuardGateStop auto
Quest property DialogueRiften auto
Quest property FavorJobsBeggars auto
Quest property WEJS09 auto
Quest property WERJ02 auto
Quest Property WERJ01  Auto  
Quest property WERJ06 auto
Quest property WE31 auto
Quest property DialogueRiftenMaul auto
Quest property WIChangeLocation03Quest auto
Quest property WEDL05 auto
Quest property WEThalmorDialogue auto
Quest Property WERoad06 auto
Quest property WERoad07 auto
Quest property WIChangeLocation04 auto
Quest property DialogueRiftenRatway auto
Quest property DialogueWinterholdCollege auto
Quest property CWDialogueSoldiers auto
Quest property WE23 auto
Quest property RelationshipOrcs auto
Quest Property WIAssault01 auto
Quest Property WEDL12 Auto
Quest Property dunValtheimKeepQST Auto
Quest Property WE17  Auto  
Quest Property Favor017  Auto  
ReferenceAlias property AMage auto
Actor Property SexPartner Auto
perk Property MGEnthirVendorPerk  Auto
MiscObject Property Gold001 Auto
Potion Property CureDisease Auto
Keyword Property pFavorSimpleDrunksSceneKeyword Auto
DA08EbonyBladeTrackingScript Property DA08EbonyBladeTracking  Auto  
Quest Property dunRobbersGorgeQST  Auto  
Faction Property RatWayRiftenEnemyFaction  Auto  
Faction Property Ratway  Auto  
Faction Property PlayerFaction  Auto  
SPELL Property DiseaseSanguinareVampiris  Auto  
HirelingQuest Property HirelingQuestScript  Auto  
GlobalVariable Property HirelingGold  Auto  
GlobalVariable Property HasHireling  Auto  
ReferenceAlias Property SSv3RentRoomInnkeeper  Auto  
ReferenceAlias Property SSv3RedwaterCageVampire  Auto  
DialogueGenericScript Property pDialogueGenericScript  Auto  
ReferenceAlias Property DCDrunk1  Auto  
ReferenceAlias Property DCDrunk2  Auto  
ReferenceAlias Property DCDrunk3  Auto  
ReferenceAlias Property DCDrunk1AnimatingAlias  Auto  
ReferenceAlias Property DCDrunk2AnimatingAlias  Auto  
ReferenceAlias Property DCDrunk3AnimatingAlias  Auto
OsexIntegrationMain Property Ostim Auto

int Property GuardRiften auto
int Property GuardRiftenJail auto
int Property GuardWhiterun auto
int Property NPCDirge auto
int Property NPCBeggar auto
int Property NPCMerchant auto
int Property NPCThief auto
int Property NPCDC auto
int Property NPCFW auto
int Property NPCAM auto
int Property NPCNivenor auto
int Property NPCAhlam auto
int Property NPCMaul auto
int Property NPCDW auto
int Property NPCThug auto
int Property NPCSD auto
int Property NPCStudent auto
int Property NPCDhraff auto
int Property NPCDN auto
int Property NPCEnthir auto
int Property NPCJzargo auto
int Property NPCSoldiers auto
int Property NPCScavengers auto
int Property NPCGrisvar auto
int Property NPCOdvan auto
int Property NPCBorkul auto
int Property NPCUraccen auto
int Property NPCTA auto
int Property OrcSex auto
int Property NPCGD auto
int Property NPCAdvDun auto
int Property NPCRelative auto 
int Property NPCVV auto
int Property NPCToll auto 
int Property NPCDrunk auto 
Int Property NPCWE17BanditToll  Auto  
Int Property NPCAnimalSeller  Auto  Conditional
Int Property NPCVampire  Auto  Conditional
Int Property NPCBrawler  Auto  Conditional
Actor Property NPCEbonyBladeRapeVictim  Auto
Int Property NPCRobbersGorge  Auto  Conditional
Actor Property NPCHireling  Auto  Conditional
Actor Property NPCHirelingRecurring  Auto  Conditional
Int Property NPCHousecarl  Auto  Conditional
Int Property NPCWEBounty  Auto  Conditional
Int Property NPCRentRoom  Auto  Conditional
Int Property NPCRedwater  Auto


ssv2qscript Property SSv2Vars  Auto  
SSv2OrcPlaythingScript Property SSv2OrcPlaything  Auto  

event OnInit()
	Ratway.SetAlly(PlayerFaction)
	Maintenance()
endEvent

Function Maintenance()
    RegisterForModEvent("ostim_start", "OnAnimationEnd")
	RegisterForModEvent("ostim_orgasm", "OnOrgasmStart")
EndFunction

; // Our callback we registered onto the global event AnimationEnd
event OnAnimationEnd(string eventName, string strArg, float numArg, Form sender)
	if (Ostim.IsActorActive(PlayerRef) || Ostim.IsActorActive(Handler.Follower.GetActorRef()) || Ostim.IsActorActive(Handler.SSv3ManualPlayerFollower.GetActorRef()))
		; This seems to be the best way to do this.
		while(OStim.AnimationRunning())
			utility.wait(1.0)
		endWhile
		if GuardRiften == 1
			;DialogueRiftenGateGuards.setstage(30) ;commented out, this is done on the dialogue fragment now
			Handler.displayFlair("You just sucked your way into Riften! Aren't you proud?")
			GuardRiften = 0
		elseif GuardWhiterun == 1
			;DialogueWhiterunGuardGateStop.setstage(10) ;commented out, this is done on the dialogue fragment now
			Handler.displayFlair("You just sucked your way into Whiterun! Aren't you proud?")
			GuardWhiterun = 0
		elseif GuardRiftenJail == 1
			DialogueRiften.setstage(20)
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			GuardRiftenJail = 0
		elseif NPCDirge == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCDirge = 0
		elseif NPCBeggar == 1
			PlayerRef.RemoveItem(Gold001, 10)
			Handler.displayFlair("Do you think you got cleaner or more dirty from that?")
			NPCBeggar = 0
		elseif NPCMerchant == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCMerchant = 0
		elseif NPCThief == 1
			Game.EnablePlayerControls()
			Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
			WERJ02.SetStage(100)
			Handler.displayFlair("He stole your stuff! Kill him while his back is turned if you want it back!")
			NPCThief = 0
		elseif NPCDC == 1
			DCDrunk1AnimatingAlias.Clear()
			DCDrunk2AnimatingAlias.Clear()
			DCDrunk3AnimatingAlias.Clear()
			DCDrunk1.GetActorRef().EvaluatePackage()
			DCDrunk2.GetActorRef().EvaluatePackage()
			DCDrunk3.GetActorRef().EvaluatePackage()
			WERJ06.setstage(85)
			WERJ06.setstage(90)
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCDC = 0
		elseif NPCFW == 1
			WERJ01.setstage(100)
			Handler.displayFlair("So you just raped a woman who had just escaped from captivity...")
			NPCFW = 0
		elseif NPCAM == 1
			WE31.setstage(200)
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCAM = 0
		elseif NPCNivenor == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCNivenor = 0
		elseif NPCAhlam == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCAhlam = 0
		elseif NPCMaul == 1
			DialogueRiftenMaul.setstage(30)
			DialogueRiftenMaul.setstage(40)
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCMaul = 0
		elseif NPCDW == 1
			WIChangeLocation03Quest.setstage(200)
			Handler.displayFlair("Make Love, not War!")
			NPCDW = 0
		elseif NPCThug == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCThug = 0
		elseif NPCSD == 1
			Handler.displayFlair("Even if you don't remember much, you're pretty sure the dealer raped you...")
			NPCSD = 0
			;register to flush SSv2Vars.SDRape var in 4 in-game hours, so the "you drugged and raped me!" option disappears for future events
			RegisterForSingleUpdateGameTime(4.0)
		elseif NPCStudent == 1
			WIChangeLocation04.SetStage(100)
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCStudent = 0
		elseif NPCDhraff == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCDhraff = 0
		elseif NPCDN == 1
			Handler.displayFlair("I bet you won't lie next time..")
			NPCDN = 0
		elseif NPCEnthir == 1
			PlayerRef.AddPerk(MGEnthirVendorPerk)
			Handler.displayFlair("Congratulations! You can now buy stuff! You just had to have sex for the privilege.")
			NPCEnthir = 0
		elseif NPCJzargo == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCJzargo = 0
		elseif NPCSoldiers == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCSoldiers = 0
		elseif NPCScavengers == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCScavengers = 0
		elseif NPCGrisvar == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCGrisvar = 0
		elseif NPCOdvan == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCOdvan = 0
		elseif NPCBorkul == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCBorkul = 0
		elseif NPCUraccen == 1
			Handler.displayFlair("Using your body is a great way to meet new friends!")
			NPCUraccen = 0
		elseif NPCTA == 1
			WERoad07.setstage(100)
			Handler.displayFlair("Make Love, Not War!")
			NPCTA = 0
		elseif OrcSex == 1
			If (RelationshipOrcs.GetStage() < 100)
				RelationshipOrcs.setstage(100)
			EndIf
			SSv2OrcPlaything.StartCooldown()
			Handler.displayFlair("Congratulations! You have now accepted the role of plaything for the Orcs.")
			OrcSex = 0
		elseif OrcSex == 2
			SSv2OrcPlaything.StartCooldown()
			Handler.displayFlair("How does it feel to have a whole race look at you as nothing more than an object for their own satisfaction?")
			OrcSex = 0
		elseif NPCGD == 1
			Handler.displayFlair("At least he got one last good fuck, right?")
			NPCGD = 0
		elseif NPCAdvDun == 1
			WERoad06.setstage(100)
			Handler.displayFlair("Yay! You found a new place to go and kill stuff!")
			NPCAdvDun = 0
		elseif NPCRelative == 1
			WIAssault01Script vMyQuest = WIAssault01 as WIAssault01Script
			vMyQuest.stop()
			Handler.displayFlair("You got away from a scolding by offering up your body. Win?")
			NPCRelative = 0
		elseif NPCVV == 1
			PlayerRef.removeItem(cureDisease, 1)
			WEDL12.setStage(100)
			Handler.displayFlair("You're really proud of yourself now, aren't you?")
			NPCVV = 0
		elseif NPCToll == 1
			;these are commented because they're handled at orgasmStart
			;PlayerRef.AddItem(Gold001, 50, false)
			;Utility.Wait(0.5)
			;dunValtheimKeepQST.setstage(15)
			Handler.displayFlair("Free passage AND some fun!")
			NPCToll = 0
		elseif NPCDrunk == 1
			If (SexPartner.GetRelationshipRank(PlayerRef) == 0)
				SexPartner.SetRelationshipRank(PlayerRef, 1)
			EndIf
			pFavorSimpleDrunksSceneKeyword.SendStoryEvent(akRef1=SexPartner)
			Handler.displayFlair("Now you have done your good deed of the day!")
			NPCDrunk = 0
		elseif NPCWE17BanditToll == 1
			;commented out, this is done in the TIF dialogue script now
			;PlayerRef.AddItem(Gold001, 100, false)
			;Utility.Wait(0.5)
			;WE17.setstage(5)
			Handler.displayFlair("You're pretty sure those weren't Imperials, but at least you're free to go.")
			NPCWE17BanditToll = 0
		elseif NPCAnimalSeller == 1
			Handler.displayFlair("This is just one step away from whoring, you know...")
			NPCAnimalSeller = 0
		elseif NPCAnimalSeller == 2
			Handler.displayFlair("That's one way to get a loyal animal...")
			NPCAnimalSeller = 0
		elseif NPCVampire == 1
			;DiseaseSanguinareVampiris.Cast(PlayerRef, PlayerRef)
			;PlayerRef.AddSpell(DiseaseSanguinareVampiris, true)
			Utility.Wait(1.0) ;don't delete this Wait, DoCombatSpellApply() doesn't work unless we wait for the SexLab animation to be fully finished
			PlayerRef.DoCombatSpellApply(DiseaseSanguinareVampiris, PlayerRef)
			Handler.displayFlair("Molag Bal is amused at this turn of events.")
			NPCVampire = 0
		ElseIf NPCBrawler == 1
			Favor017.setstage(10)
			Utility.Wait(0.1)
			Favor017.setstage(20)
			Handler.displayFlair("This is much better than a bleeding nose!")
			NPCBrawler = 0
		ElseIf NPCEbonyBladeRapeVictim != None
			DA08EbonyBladeTracking.FriendKilled()
			NPCEbonyBladeRapeVictim.SetRelationshipRank(PlayerRef, -2)
			Handler.displayFlair("Mephala is pleased with your betrayal.")
			NPCEbonyBladeRapeVictim = None
		ElseIf NPCRobbersGorge == 1
			Handler.displayFlair("Free passage AND some fun!")
			NPCRobbersGorge = 0
		ElseIf NPCHireling != None
			PlayerRef.AddItem(Gold001, HirelingGold.Value as int, false)
			Utility.Wait(0.5)
			HasHireling.Value=1
			HirelingQuestScript.PayHireling(NPCHireling)
			;Handler.displayFlair("<hireling placeholder>")
			NPCHireling = None
		ElseIf NPCHirelingRecurring != None
			;Handler.displayFlair("<hirelingRecurring placeholder>")
			NPCHirelingRecurring = None
		ElseIf NPCHousecarl == 1
			Handler.displayFlair("Owning a house does have its benefits!")
			NPCHousecarl = 0
		ElseIf NPCWEBounty == 1
			;Handler.displayFlair("<bounty hunter placeholder>")
			NPCWEBounty = 0
		ElseIf NPCRentRoom == 1
			;Handler.displayFlair("<rent room placeholder>")
			PlayerRef.AddItem(Gold001, pDialogueGenericScript.RoomRentalCost.GetValueInt(), false)
			(SSv3RentRoomInnkeeper.GetActorRef() as RentRoomScript).RentRoom(pDialogueGenericScript)
			SSv3RentRoomInnkeeper.Clear()
			NPCRentRoom = 0	
		ElseIf NPCRedwater == 1
			Debug.MessageBox("Taking the blissful vampire by surprise, you reach for his dagger and lodge it in his neck.")
			Utility.Wait(0.5)
			SSv3RedwaterCageVampire.GetActorRef().Kill(PlayerRef)
			SSv3RedwaterCageVampire.Clear()
			Handler.displayFlair("He never even saw it coming.")
			NPCRedwater = 0	
		EndIf
	EndIf
endEvent


event OnOrgasmStart(string eventName, string strArg, float numArg, Form sender)		
	if (Ostim.IsActorActive(PlayerRef) || Ostim.IsActorActive(Handler.Follower.GetActorRef()) || Ostim.IsActorActive(Handler.SSv3ManualPlayerFollower.GetActorRef()))
		; This seems to be the best way to do this.
		while(OStim.AnimationRunning())
			utility.wait(1.0)
		endWhile
		; waiting for the SexLab animation event to finish broadcasting avoids some weird bugs
		Utility.Wait(1.0)
		
		If NPCToll == 1
			PlayerRef.AddItem(Gold001, 50, false)
			Utility.Wait(0.5)
			dunValtheimKeepQST.setstage(15)
		Endif
	EndIf
endEvent


Event OnUpdateGameTime()
	;flush top-level dialogue vars
	if SSv2Vars.SDRape > 0
		SSv2Vars.SDRape = 0
	EndIf
	
	;when you add more vars here, don't do ElseIfs, have each variable have their own independent IF cycle. 
	;This will allow more vars to be flushed at once if the player is going through a lot of events simultaneously.
	;(it won't cause problems with vars being reset too soon either, as consecutive calls to RegisterForSingleUpdateGameTime before it has had a chance to fire OnUpdateGameTime will simply reset the counter)
EndEvent

Function OrcRelationshipRapeRoll()
	Debug.Trace("Sls tried to run SSv2.OrcRelationshipRapeRoll, but that function no longer exists.")
EndFunction