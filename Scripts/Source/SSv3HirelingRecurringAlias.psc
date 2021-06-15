Scriptname SSv3HirelingRecurringAlias extends ReferenceAlias  

int Property approachChance = 0 Auto
GlobalVariable Property HirelingApproaching  Auto  
Actor Property PlayerRef  Auto  
Faction Property CurrentFollowerFaction  Auto  

keyword property LocTypeDwelling auto
keyword property LocTypeDungeon auto
keyword property LocTypeHold auto
keyword property LocTypeMilitaryfort auto
keyword property LocTypeTown auto
keyword property LocTypeMine auto
keyword property LocTypeDraugrcrypt auto
keyword property LocTypeCity auto
keyword property LocTypeDragonpriestlair auto
keyword property LocTypeBanditcamp auto
keyword property LocTypeHabitation auto
keyword property LocTypeFalmerhive auto
keyword property LocTypeVampirelair auto
keyword property LocTypeJail auto
keyword property LocTypeDwarvenAutomatons auto
keyword property LocTypePlayerHome auto

Event OnLoad()
	
	Actor hireling = GetActorRef()

	If (hireling.IsInFaction(CurrentFollowerFaction) == false || hireling.IsDead())
		Clear()
		return
	EndIf

	If (PlayerRef.GetCurrentLocation() != hireling.GetCurrentLocation() )
		return
	EndIf
	
	int locationMultiplier
	int chanceIncrease = 3
	
	if (hireling.GetCurrentLocation()).haskeyword(loctypejail)
		locationMultiplier = 0
	elseif (hireling.GetCurrentLocation()).haskeyword(loctypedwelling) || (hireling.GetCurrentLocation()).haskeyword(loctypecity) || (hireling.GetCurrentLocation()).haskeyword(loctypeplayerhome)
		locationMultiplier = 4
	elseif hireling.GetCurrentLocation().haskeyword(loctypetown) || hireling.GetCurrentLocation().haskeyword(loctypehabitation)
		locationMultiplier = 3
	elseif hireling.GetCurrentLocation().haskeyword(loctypedraugrcrypt) || hireling.GetCurrentLocation().haskeyword(loctypedragonpriestlair) || hireling.GetCurrentLocation().haskeyword(loctypebanditcamp) || hireling.GetCurrentLocation().haskeyword(loctypefalmerhive) || hireling.GetCurrentLocation().haskeyword(loctypevampirelair) || hireling.GetCurrentLocation().haskeyword(loctypedwarvenautomatons) || hireling.GetCurrentLocation().haskeyword(loctypemilitaryfort) || hireling.GetCurrentLocation().haskeyword(loctypedungeon) || hireling.GetCurrentLocation().haskeyword(loctypemine)
		locationMultiplier = 1
	else 
		;wilderness
		locationMultiplier = 2
	endif
	
	approachChance = approachChance + (chanceIncrease * locationMultiplier)
	int roll = Utility.RandomInt(1,100)
	;miscUtil.PrintConsole(approachChance + " vs " + roll)
	If (roll <= approachChance && locationMultiplier >= 2)
		approachChance = 0
		HirelingApproaching.SetValue(1)
		GetActorRef().EvaluatePackage()
		;miscUtil.PrintConsole("approaching")
	EndIf
endEvent

