Scriptname SSv2QuestScript extends Quest Conditional

SSv3Config Property SSv3MCM  Auto  
SSv3Handler Property Handler  Auto  
OsexIntegrationMain Property Ostim Auto
Quest property FreeformRiften04 auto
Quest property Favor013 auto
Quest property MQ202 auto
Quest property MGRAppJzargo01 auto
Quest property RoriksteadFreeform auto
Quest property MGRAppOnmund01 auto
Quest property MS02 auto
Quest property MS01 auto
Quest property MGRAppBrelyna01 auto
Quest property FreeformRiften11 auto
Quest property DA15 auto
Quest property SolitudeFreeform06 auto
Quest property FreeformRiften13 auto
Quest property FreeformMarkarthJ auto
Quest Property TG00 Auto
TG00QuestScript Property TG00Script  Auto  
Quest Property FreeformIvarstead02 Auto
Quest Property FreeformShipsDawnstar Auto
Quest Property FreeformRiften22 Auto
Quest Property TG01 Auto
Quest Property TGBan Auto
Quest Property TG04 Auto
Quest Property TG06 Auto
Quest Property TG07 Auto
Quest Property dunMWQQST Auto
Quest Property FreeformWinterholdA Auto
Quest Property DA11 Auto
Quest Property FreeformKarthwastenA Auto
Quest Property TG00MiscHandler Auto
Quest Property FreeFormMarkarthE Auto
Quest Property FreeformShorsStone02 Auto
MiscObject Property MS01WeylinKey Auto
MiscObject Property MS01MargretKey Auto
MiscObject Property Jar Auto
ReferenceAlias Property pMark01 Auto
ReferenceAlias Property pMark02 Auto
ReferenceAlias Property pMark03 Auto
Actor property PlayerRef auto
Actor Property SexPartner Auto
GlobalVariable Property pFFI02Sad  Auto 
LeveledItem Property FavorRewardGoldLarge  Auto
SSv2QScript Property SSv2  Auto  
GlobalVariable Property pTGBanGoldTotal Auto Conditional
Key Property pTG06Key Auto
MiscObject Property Gold001  Auto  
Quest Property FreeformRiverwood01  Auto  
Quest Property VC01  Auto  
Quest Property DB01Misc  Auto  
DarkBrotherhood Property DarkBrotherhoodScript  Auto  
MS08QuestScript Property MS08Script  Auto  
Quest Property CR04  Auto  
Quest Property FreeformRiften20  Auto  
TG02QuestScript Property TG02Script  Auto  
ReferenceAlias Property TG02Key  Auto  
ReferenceAlias Property TG02AringothAlias  Auto  
Faction Property TownGoldenglowEstateFaction  Auto  
Quest Property t02  Auto  
T02QuestScript Property t02script  Auto  
ms10questscript Property MS10Script  Auto  
DLC2DialogueRRQuestScript Property DLC2RavenRockBoatScript  Auto  
Quest Property DLC1VQ03Hunter  Auto  
Quest Property DLC1VQ03Vampire  Auto  
Quest Property dunMistwatchQST  Auto  
Actor Property CamillaREF  Auto  
Actor Property SvenREF  Auto  
Actor Property FaendalREF  Auto  
Actor Property AssistJarlREF  Auto  
Actor Property DLC2RavenRockBoatCaptainREF  Auto  
ReferenceAlias Property DLC2MH02ThirskChief  Auto  
ReferenceAlias Property DLC2MH02ThirskRiek1  Auto  
ReferenceAlias Property DLC2MH02ThirskRiek2  Auto  
ReferenceAlias Property DLC2MH02ThirskRiek3  Auto  
Quest Property MG01  Auto  
ReferenceAlias Property MG01FaraldaAlias  Auto  
Quest Property MGR02  Auto  


int Property IngunSex auto conditional
int Property MikaelSex auto conditional
int Property IrnskarSex auto conditional
int Property MulushSex auto conditional
int Property TorbjornSex auto conditional
int Property RanmirSex auto conditional
int Property VekelSex auto conditional
int Property DirgeSex auto conditional
int Property JzargoSex auto conditional
int Property MralkiSex auto conditional
int Property EnthirSex auto conditional
int Property BorkulSex auto conditional
int Property GarveySex auto conditional
int Property InnkeeperSex auto conditional
int Property BrelynaSex auto conditional
int Property BolliSex auto conditional
int Property HofgrirSex auto conditional
int Property IndarynSex auto conditional
int Property ErdiSex auto conditional
int Property UnaSex auto conditional
int Property VittoriaSex auto conditional
int Property AlessandraSex auto conditional
int Property StewardSex auto conditional
int Property Brynjolvsex auto conditional
int Property NarfiSex Auto Conditional
int Property SailorSex Auto Conditional
int Property ElisifSex Auto Conditional
int Property SapphireSex Auto Conditional
int Property HaelgaSex Auto Conditional
int Property KeeravaSex Auto Conditional
int Property TalenJeiSex Auto Conditional
int Property BersiSex Auto Conditional
int Property BanSex Auto Conditional
int Property GulumEiSex Auto Conditional
int Property CalcelmoSex Auto Conditional
int Property ValdSex Auto Conditional
int Property BirnaSex Auto Conditional
int Property CarlottaSex Auto Conditional
int Property VerulusSex Auto Conditional
int Property AtarSex Auto Conditional
int Property AineSex Auto Conditional
int Property MargretSex Auto Conditional
int Property LisbetSex Auto Conditional
Int Property SylgjaSex Auto Conditional
Int Property DerkeethusSex Auto Conditional
Int Property UlfrSex Auto Conditional
Int Property RoggiSex Auto Conditional
Int Property ErikSex Auto Conditional
Int Property FaendalSex Auto Conditional
Int Property SvenSex Auto Conditional
Int Property CamillaSex Auto Conditional
Int Property VampireCureSex Auto Conditional
Int Property AssistJarlSex Auto Conditional
Int Property YsoldaSex Auto Conditional
Int Property DelayedSex Auto Conditional
Int Property MS08GuardSex Auto Conditional
Int Property CompellingTributeSex Auto Conditional
Int Property CR04Sex Auto Conditional
Int Property WujeetaSex Auto Conditional
Int Property AringothSex Auto Conditional
Int Property YngvarSex Auto Conditional
Int Property MS10Stig Auto Conditional
Int Property DLC2RavenRockBoatSex Auto Conditional
Int Property DLC1VQ03MothClueSex Auto Conditional
Int Property FjolaSex Auto Conditional
Int Property ThirskHallGangRape = 0 Auto Conditional
Int Property FaraldaSex Auto Conditional
Int Property CleansePointsSex Auto Conditional
Int Property DA07JorgenSex Auto Conditional
Int Property FreeformDushSex Auto Conditional
Int Property DA06OrcTribeSex Auto Conditional
Int Property FreeformDragonBridge01OldaSex Auto Conditional

ssv2qscript Property SSv2Vars  Auto  
SSv3_AssistJarlQuestScript Property AssistJarlQuestScript  Auto  

event OnInit()
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
		if BrynjolvSex == 1
			TG00Script.pTG00ArrestStopper == 1
			TG00.setstage(200)
			TG00MiscHandler.setstage(200)
			Handler.displayFlair("Did you just start a new career?")
			BrynjolvSex = 0
		elseif IngunSex == 1
			FreeformRiften04.Setstage(20)
			Handler.displayFlair("You just extorted that poor girl! Have you no shame?")
			IngunSex = 0
		elseif MikaelSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("Let's just hope he doesn't start pestering you now...")
			MikaelSex = 0
		elseif IrnskarSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("Selling yourself for gambling debts. That sounds like a problem to me...")
			IrnskarSex = 0
		elseif MulushSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("Did you really think he would go any easier on you than the workers?")
			MulushSex = 0
		elseif TorbjornSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("So you sell yourself so someone else gets paid?")
			TorbjornSex = 0
		elseif RanmirSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("The only thing better than gold is someone willing to fuck your brains out.")
			RanmirSex = 0
		elseif VekelSex == 1
			MQ202.SetStage(50)
			Handler.displayFlair("You do know he would have told you anyway?")
			VekelSex = 0
		elseif DirgeSex == 1
			MQ202.SetStage(50)
			Handler.displayFlair("You do know he would have told you anyway?")
			DirgeSex = 0
		elseif JzargoSex == 1
			MGRAppJzargo01.setstage(200)
			Handler.displayFlair("You feel all better now...")
			JzargoSex = 0
		elseif JzargoSex == 2
			Handler.displayFlair("You sure showed that cat how good you are at this!")
			JzargoSex = 0
		elseif MralkiSex == 1
			RoriksteadFreeform.setstage(20)
			Handler.displayFlair("You fucked a new hero into the world, and you didn't even have to give birth!")
			MralkiSex = 0
		elseif EnthirSex == 1
			SSv2.MultipleSex = 0
			MGRAppOnmund01.setstage(40)
			Handler.displayFlair("What won't we do for friends?")
			EnthirSex = 0
		elseif EnthirSex == 2
			SSv2.MultipleSex = 0
			TG06.setstage(40)
			Handler.displayFlair("You really are giving out blowjobs left and right, aren't you?")
			EnthirSex = 0
		elseif BorkulSex == 1
			MS02.SetStage(20)
			Handler.displayFlair("You feel dirty, but you just know that it would have been much worse had you said no...")
			BorkulSex = 0
		elseif BorkulSex == 2
			MS02.SetStage(20)
			Handler.displayFlair("Should have just bent over willingly...")
			BorkulSex = 0
		elseif MargretSex == 1
			Handler.displayFlair("The perks of saving someone's life...")
			MargretSex = 0
		elseif GarveySex == 1
			Game.GetPlayer().AddItem(MS01WeylinKey, 1)
			MS01.SetStage(45)
			Handler.displayFlair("Well at least you saved some gold by not going for a bribe...")
			GarveySex = 0
		elseif InnkeeperSex == 1
			Game.GetPlayer().AddItem(MS01MargretKey, 1)
			MS01.SetStage(32)
			Handler.displayFlair("You just let him use your body, and all you got was this shitty key he'd have given you anyway.")
			InnkeeperSex = 0
		elseif BrelynaSex == 1
			;MGRAppBrelyna01.setstage(200)   ;this needed to be done sooner, otherwise a Blocking dialogue will prevent the player from having access to "This should be private enough."
			Handler.displayFlair("Ah, she made you feel all better!")
			BrelynaSex = 0
		elseif BolliSex == 1
			Game.GetPlayer().AddItem(pMark01.GetRef())
			FreeformRiften11.setstage(30)
			Handler.displayFlair("Sex marks in return for sex, there is some irony here.")
			BolliSex = 0
		elseif HofgrirSex == 1
			Game.GetPlayer().AddItem(pMark02.GetRef())
			FreeformRiften11.setstage(40)
			Handler.displayFlair("What makes you any different from Haelga?")
			HofgrirSex = 0
		elseif IndarynSex == 1
			Game.GetPlayer().AddItem(pMark03.GetRef())
			FreeformRiften11.setstage(50)
			Handler.displayFlair("Maybe you should just keep the marks, they look so shiny!")
			IndarynSex = 0
		elseif ErdiSex == 1
			DA15.setstage(45)
			Handler.displayFlair("You know asking nicely would have been enough?")
			ErdiSex = 0
		elseif UnaSex == 1
			DA15.setstage(45)
			Handler.displayFlair("You know asking nicely would have been enough?")
			UnaSex = 0
		elseif VittoriaSex == 1
			SolitudeFreeform06.setstage(20)
			Handler.displayFlair("For the wine!")
			VittoriaSex = 0
		Elseif AlessandraSex == 1
			FreeformRiften13.setstage(20)
			Handler.displayFlair("Don't you feel great using a poor woman's circumstances to extort sex?")
			AlessandraSex = 0
		elseif StewardSex == 1
			FreeformMarkarthJ.setstage(20)
			Handler.displayFlair("What a fun little experiment!")
			StewardSex = 0
		ElseIf NarfiSex == 1
			pFFI02Sad.Value = 1
			FreeformIvarstead02.setstage(200)
			Handler.displayFlair("At least he got a little comfort from you...")
			NarfiSex = 0
		Elseif Sailorsex == 3
			Game.GetPlayer().AddItem(FavorRewardGoldLarge)
			FreeformShipsDawnstar.setstage(20)
			Handler.displayFlair("And you will henceforth be know as the deck-mattress of The Sea Squall!")
			Sailorsex = 0
		Elseif ElisifSex == 1
			Handler.displayFlair("You just became the lover of a possible future Queen!")
			ElisifSex = 0
		Elseif ElisifSex == 2
			Handler.displayFlair("Do all noble women have such dirty minds?")
			ElisifSex = 0
		Elseif SapphireSex == 1
			FreeformRiften22.setstage(30)
			Handler.displayFlair("You play the blackmail game very well my friend...")
			SapphireSex = 0
		Elseif SapphireSex == 2
			SSv2.TGFuck = 0
			FreeformRiften22.setstage(30)
			Handler.displayFlair("Sapphire will be happy to know that you have fulfilled your part of the bargain.")
			SapphireSex = 0
		Elseif HaelgaSex == 1
			TG01.setstage(45)
			Handler.displayFlair("Is that what you call mutual satisfaction?")
			HaelgaSex = 0
		Elseif HaelgaSex == 2
			SSv2.NormalRape = 0
			TG01.setstage(45)
			Handler.displayFlair("I think you and Svana got the best out of this deal.")
			HaelgaSex = 0
		Elseif KeeravaSex == 1
			TG01.setstage(30)
			Handler.displayFlair("It seems like you'll fit right in with the Thieves Guild!")
			KeeravaSex = 0
		Elseif KeeravaSex == 2
			SSv2.NormalRape = 0
			TG01.setstage(30)
			Handler.displayFlair("Well he said not to kill them, this isn't killing! It might not be very nice, but it is not killing!")
			KeeravaSex = 0
		Elseif TalenJeiSex == 1
			TG01QuestScript pTG01Script = TG01 as TG01QuestScript
			pTG01Script.pTG01LoverFound = 1
			if TG01.IsObjectiveDisplayed(21) == 1
				TG01.SetObjectiveCompleted(21,1)
			endif
			Handler.displayFlair("Note to self, Talen-Jei is not good boyfriend material..")
			TalenJeiSex = 0
		Elseif TalenJeiSex == 2
			SSv2.NormalRape = 0
			TG01QuestScript pTG01Script = TG01 as TG01QuestScript
			pTG01Script.pTG01LoverFound = 1
			if TG01.IsObjectiveDisplayed(21) == 1
				TG01.SetObjectiveCompleted(21,1)
			endif
			Handler.displayFlair("Making threats about his woman, that's not nice is it?")
			TalenJeiSex = 0
		Elseif BersiSex == 1
			TG01.setstage(40)
			Handler.displayFlair("I think the other guild members will have different ways of doing things. Just a thought...")
			BersiSex = 0
		Elseif BersiSex == 2
			SSv2.NormalRape = 0
			TG01.setstage(40)
			Handler.displayFlair("Well at least you sent a message! Right?")
			BersiSex = 0
		Elseif BanSex == 1
			if SSv2.TGBanFuck >= 7
				;this var doesn't seem to be used anywhere?
				;SSv2.TGCumDump = 1
				PlayerRef.additem(Gold001, 1000, false) ;give the player 1000 gold to offset the -1000 that comes from TGBan.setstage(200)
				Utility.Wait(0.5)
				TGBan.setstage(200)
				SSv2.TGBanFuck = 0
			Else
				SSv2.TGBanFuck += 1
				int remaining = 8 - SSv2.TGBanFuck
				Handler.displayFlair(SSv2.TGBanFuck + " down, " + remaining + " to go...", override = true)
			EndIf
			Bansex = 0
		Elseif GulumEiSex == 1
			TG04.setstage(37)
			Handler.displayFlair("You just sucked a man's dick, hoping for information afterwards...")
			GulumEiSex = 0
		Elseif CalcelmoSex == 1
			Game.GetPlayer().Additem(pTG06Key, 1)
			TG06.setstage(25)
			dunMWQQST.SetStage(1)
			Handler.displayFlair("Ah, the sacrifices of the pursuit of knowledge.")
			CalcelmoSex = 0
		Elseif ValdSex == 1
			TG07.setstage(48)
			Handler.displayFlair("Being a thief isn't all that different from being a whore, is it?")
			ValdSex = 0
		Elseif BirnaSex == 1
			FreeformWinterholdA.setstage(20)
			Game.GetPlayer().Additem(Jar, 1)
			Handler.displayFlair("Don't you sometimes wish all shopping were this much fun?")
			BirnaSex = 0
		Elseif CarlottaSex == 1
			If PlayerRef.GetLeveledActorBase().GetSex() == 1
				Handler.displayFlair("Girl on girl is so much better! You probably didn't fuck Mikael at all, right?")
			Else
				Handler.displayFlair("Hopefully Mikael won't hear about this!")
			EndIf
			CarlottaSex = 0
		Elseif CarlottaSex == 2
			Handler.displayFlair("You really should rub this in with Mikael!")
			CarlottaSex = 0
		Elseif VerulusSex == 1
			DA11.SetStage(40)
			SSv2.VerulusFuck = 1
			Handler.displayFlair("Fuck the clerics! Literally...")
			VerulusSex = 0
		Elseif VerulusSex == 2
			Handler.displayFlair("Dungeon-crawling with benefits!")
			VerulusSex = 0
		Elseif VerulusSex == 3
			VerulusSex = 0
		ElseIf AtarSex == 1
			FreeformKarthwastenA.setstage(25)
			Handler.displayFlair("It seems like you made Dagger a very happy cock!")
			AtarSex = 0
		ElseIf AineSex == 1
			FreeformKarthwastenA.setstage(20)
			Handler.displayFlair("Now you got your carnal pleasures, go get those bastards out of that mine!")
			AineSex = 0
		ElseIf LisbetSex == 1
			FreeformMarkarthE.setstage(20)
			Handler.displayFlair("Now that's a reward to remember.")
			LisbetSex = 0
		ElseIf SylgjaSex == 1
			FreeformShorsStone02.setstage(20)
			Handler.displayFlair("And now you have all the motivation you could need!")
			SylgjaSex = 0
		ElseIf DerkeethusSex == 1
			Handler.displayFlair("You should save people more often!")
			DerkeethusSex = 0
		ElseIf UlfrSex == 1
			Handler.displayFlair("The old man won't soon forget that one!")
			UlfrSex = 0
		ElseIf RoggiSex == 1
			Favor013.setstage(15)
			Handler.displayFlair("Who could even care about debts after that?")
			RoggiSex = 0
		ElseIf ErikSex == 1
			Handler.displayFlair("That was much better than Mralki, wasn't it?")
			ErikSex = 0
		ElseIf FaendalSex == 1
			;set Faendal friendly to player, set Camilla friendly to Sven and  hostile to Faendal
			FaendalREF.SetRelationshipRank(PlayerRef, 2)
			CamillaREF.SetRelationshipRank(FaendalREF, -1)
			CamillaREF.SetRelationshipRank(SvenREF, 1)
			SSv2Vars.ALovelyLetterRelationship = 1
			Handler.displayFlair("That's one way to break off a love triangle!")
			FaendalSex = 0
		ElseIf FaendalSex == 2
			;Handler.displayFlair("<placeholder>")
			FaendalSex = 0
		ElseIf SvenSex == 1
			;set Sven friendly to player, set Camilla friendly to Faendal and  hostile to Sven
			SvenREF.SetRelationshipRank(PlayerRef, 2)
			CamillaREF.SetRelationshipRank(FaendalREF, 1)
			CamillaREF.SetRelationshipRank(SvenREF, -1)
			SSv2Vars.ALovelyLetterRelationship = 2
			Handler.displayFlair("That's one way to break off a love triangle!")
			SvenSex = 0
		ElseIf SvenSex == 2
			;Handler.displayFlair("<placeholder>")
			SvenSex = 0
		ElseIf CamillaSex == 1
			;set Sven and Faendal both hostile to player. Set Camilla hostile towards the duo, and friendly towards player. 
			FaendalREF.SetRelationshipRank(PlayerRef, -1)
			SvenREF.SetRelationshipRank(PlayerRef, -1)
			CamillaREF.SetRelationshipRank(FaendalREF, -1)
			CamillaREF.SetRelationshipRank(SvenREF, -1)
			CamillaREF.SetRelationshipRank(PlayerRef, 2)
			SSv2Vars.ALovelyLetterRelationship = 3
			Handler.displayFlair("That's one way to break off a love triangle!")
			CamillaSex = 0
		ElseIf CamillaSex == 2
			;Handler.displayFlair("<placeholder>")
			CamillaSex = 0
		ElseIf VampireCureSex == 1
			VC01.setStage(125)
			;Handler.displayFlair("<placeholder>")
			VampireCureSex = 0
		ElseIf AssistJarlSex == 1
			AssistJarlQuestScript.CompleteAssistQuest(AssistJarlREF)
			Handler.displayFlair("Sexing your way to the top!")
			AssistJarlREF = None
			AssistJarlSex = 0
		ElseIf AssistJarlSex == 2
			Handler.displayFlair("Friends in high places!")
			AssistJarlSex = 0	
		ElseIf YsoldaSex == 1
			Handler.displayFlair("Morally questionable, both of you...")
			YsoldaSex = 0		
		ElseIf DelayedSex == 1
			DB01Misc.SetStage(50)
			Handler.displayFlair("Going great lengths to help people in need!")
			DelayedSex = 0
		ElseIf DelayedSex == 2
			DB01Misc.SetStage(40)
			DarkBrotherhoodScript.CiceroFramed = 3
			DarkBrotherhoodScript.CiceroGuardResponse = 1
			Handler.displayFlair("That foolish jester probably had it coming anyway!")
			DelayedSex = 0	
		ElseIf MS08GuardSex == 1
			MS08Script.Finevar=2
			;Handler.displayFlair("<placeholder>")
			MS08GuardSex = 0
		ElseIf CompellingTributeSex == 1
			;Handler.displayFlair("<placeholder>")
			CompellingTributeSex = 0
		ElseIf CR04Sex == 1
			CR04.SetStage(20)
			Handler.displayFlair("Way better than a bloody nose!")
			CR04Sex = 0
		ElseIf WujeetaSex == 1
			FreeformRiften20.SetStage(20)
			Handler.displayFlair("Wonder if she'll get addicted to this instead?")
			WujeetaSex = 0
		ElseIf AringothSex == 1
			Game.GetPlayer().AddItem(TG02Key.GetRef())
			TG02AringothAlias.GetActorRef().RemoveItem(TG02Key.GetRef())
			TG02Script.pTG02AringothDone = 2
			Handler.displayFlair("Better get out of here before he changes his mind!")
			AringothSex = 0
			Utility.Wait(15.0)
			PlayerRef.RemoveFromFaction(TownGoldenglowEstateFaction)
		ElseIf YngvarSex == 1
			PlayerRef.AddItem(t02script.LovePoem.GetRef(), 1)
			T02.SetStage(50)
			YngvarSex = 0
		ElseIf MS10Stig == 1
			MS10Script.StigPersuaded = true
			MS10Stig = 0
		ElseIf DLC2RavenRockBoatSex == 1
			Utility.Wait(1.0)
			DLC2RavenRockBoatScript.SetSail(DLC2RavenRockBoatCaptainREF, 0)
			DLC2RavenRockBoatSex = 0
		ElseIf DLC1VQ03MothClueSex == 1	
			If DLC1VQ03Hunter.IsRunning() && DLC1VQ03Hunter.GetStage() < 50
				DLC1VQ03Hunter.SetStage(50)
			ElseIf DLC1VQ03Vampire.IsRunning() && DLC1VQ03Vampire.GetStage() < 47
				DLC1VQ03Vampire.SetStage(47)
			EndIf
			DLC1VQ03MothClueSex = 0
		ElseIf ThirskHallGangRape > 0 
			ThirskHallGangRape = ThirskHallGangRape + 1
			If ThirskHallGangRape == 2
				DLC2MH02ThirskRiek1.GetActorRef().MoveTo(PlayerRef)
				DLC2MH02ThirskRiek2.GetActorRef().MoveTo(PlayerRef)
				Handler.CreatureSexForThree(DLC2MH02ThirskRiek1.GetActorRef(), DLC2MH02ThirskRiek2.GetActorRef())
			ElseIf ThirskHallGangRape == 3
				DLC2MH02ThirskRiek3.GetActorRef().MoveTo(PlayerRef)
				Handler.CreatureSexForTwo(DLC2MH02ThirskRiek3.GetActorRef())
			ElseIf ThirskHallGangRape == 4
				DLC2MH02ThirskRiek1.GetActorRef().MoveTo(PlayerRef)
				DLC2MH02ThirskRiek2.GetActorRef().MoveTo(PlayerRef)
				Handler.CreatureSexForThree(DLC2MH02ThirskRiek1.GetActorRef(), DLC2MH02ThirskRiek2.GetActorRef())
			ElseIf ThirskHallGangRape == 5
				DLC2MH02ThirskRiek3.GetActorRef().MoveTo(PlayerRef)
				Handler.CreatureSexForTwo(DLC2MH02ThirskRiek3.GetActorRef())
			ElseIf ThirskHallGangRape >= 6
				ThirskHallGangRape = 0
			EndIf
		ElseIf FaraldaSex == 1
			MG01.setstage(30)
			MG01FaraldaAlias.GetActorReference().EvaluatePackage()
			FaraldaSex = 0
		ElseIf CleansePointsSex == 1
			MGR02.SetStage(20)
			Utility.Wait(1)
			MGR02.SetStage(200)
			CleansePointsSex = 0
		ElseIf DA07JorgenSex == 1
			DA07JorgenSex = 0
		ElseIf FreeformDushSex == 1
			FreeformDushSex = 0
		ElseIf DA06OrcTribeSex == 1
			DA06OrcTribeSex = 0
		ElseIf FreeformDragonBridge01OldaSex == 1
			FreeformDragonBridge01OldaSex = 0
		EndIf
	EndIf
endEvent


event OnOrgasmStart(string eventName, string strArg, float numArg, Form sender)		
	if (Ostim.IsActorActive(PlayerRef) || Ostim.IsActorActive(Handler.Follower.GetActorRef()) || Ostim.IsActorActive(Handler.SSv3ManualPlayerFollower.GetActorRef()))
		; This seems to be the best way to do this.
		while(OStim.AnimationRunning())
			utility.wait(1.0)
		endWhile
		;waiting for the SexLab animation event to finish broadcasting avoids some weird bugs
		Utility.Wait(1.0)
		
		If FjolaSex == 1
			dunMistwatchQST.SetStage(80)
			SSv2Vars.HasFuckedFjola = 1
			Handler.displayFlair("Christer definitely doesn't need to know about this.")
			FjolaSex = 0
		Endif
	EndIf
	
endEvent



