;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SSv3_QF_SSv3WERoad11 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FarmerEnd
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarmerEnd Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantCampCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantCampCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farmer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farmer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY currentHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_currentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantCampEdge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantCampEdge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantCamp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GiantCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;clean up. Need to reset faction, dispel cloak, and anything else?
PlayerRef.DispelSpell(SSv3_GiantScannerCloakAbility)
PlayerRef.RemoveFromFaction(GiantFaction)
Alias_FarmerEnd.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;stuff
If IsObjectiveDisplayed(0)
SetObjectiveFailed(0)
EndIf
If IsObjectiveDisplayed(10)
SetObjectiveFailed(10)
EndIf
Utility.Wait(1.0)
SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;reward player
int goldReward = 1000 + ( PlayerRef.GetLevel() * 20 )
Game.GetPlayer().AddItem(Gold001, goldReward, false)
Utility.Wait(1.0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;stuff
If IsObjectiveDisplayed(0)
SetObjectiveFailed(0)
EndIf
If IsObjectiveDisplayed(10)
SetObjectiveFailed(10)
EndIf
Utility.Wait(1.0)
SetStage(99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(0)
PlayerAliasScript.StartCloak()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Faction Property GiantFaction  Auto  

SPELL Property SSv3_GiantScannerCloakAbility  Auto  

MiscObject Property Gold001  Auto  

SSv3_WERoad11PlayerAlias Property PlayerAliasScript  Auto  
