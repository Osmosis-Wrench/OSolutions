Scriptname SSv3_WERoad11PlayerAlias extends ReferenceAlias  

Actor Property PlayerRef  Auto  
SPELL Property SSv3GiantScannerCloakAbility  Auto  

;Event OnInit()
;	PlayerRef.AddToFaction(GiantFaction)
;	SSv3WERoad11QuestScript.Initialize()
;	RegisterForSingleUpdate(1)
;EndEvent

Function startCloak()
	
	PlayerRef.AddToFaction(GiantFaction)
	SSv3WERoad11QuestScript.Initialize()
	RegisterForSingleUpdate(1)

EndFunction

Event OnPlayerLoadGame()
	SSv3WERoad11QuestScript.Maintenance()
EndEvent
 
Event OnUpdate()
	If self.GetOwningQuest().IsRunning()
		PlayerRef.AddSpell(SSv3GiantScannerCloakAbility, false)
		; How long you would like to keep the cloak active
		Utility.Wait(1)
		PlayerRef.RemoveSpell(SSv3GiantScannerCloakAbility)
		; How long until the cloak activates again
		RegisterForSingleUpdate(1)
	EndIf
EndEvent

Faction Property GiantFaction  Auto  

SSv3WERoad11Quest Property SSv3WERoad11QuestScript  Auto  
