Scriptname SSv3PlayerAlias extends ReferenceAlias  

ssv2npcscript Property SSv2NPC  Auto  
ssv2questscript Property SSv2Quest  Auto
Actor Property PlayerRef  Auto  
SSv3Config Property SSv3MCM  Auto  
GlobalVariable Property SSv3_PlayerGender  Auto  
OsexIntegrationMain Property Ostim Auto


Event OnInit()
	;SSv2NPC.Maintenance()
	;SSv2Quest.Maintenance()  ;these 2 aren't needed as the respective scripts' OnInits already do it
	Maintenance()
EndEvent


Event OnPlayerLoadGame()
	Maintenance()
EndEvent


Function Maintenance()
	SSv2NPC.Maintenance()
	SSv2Quest.Maintenance()

	RegisterForModEvent("SexLabActorGenderChange", "OnGenderChange")
	SetPlayerGender()
EndFunction


Event OnGenderChange(Form akActor, int newGender)
	miscutil.PrintConsole("[SexLab Solutions] Gender change detected, updating player's gender.")
	SetPlayerGender()
EndEvent


Function SetPlayerGender()
	;SSv3_PlayerGender.SetValue(SexLab.GetGender(Game.GetPlayer()))
	If (Ostim.IsFemale(PlayerRef))
		SSv3_PlayerGender.SetValue(1)
	Else
		SSv3_PlayerGender.SetValue(0)
	EndIf
EndFunction

