Scriptname SSv3Handler extends Quest  

SSv3Config Property SSv3MCM  Auto 
Actor Property PlayerRef  Auto  
ReferenceAlias Property Follower  Auto  
ReferenceAlias Property SSv3ManualPlayerFollower  Auto  
OsexIntegrationMain Property OStim Auto
ODatabaseScript Property ODatabase Auto

Function displayFlair(String flair, Bool override = false)
	If ( ( SSv3MCM.op_flairToggle == true ) || override )
		Debug.Notification(flair)
		miscutil.PrintConsole("[SexLab Solutions - Ostim] " + flair)
	EndIf
EndFunction

int Function GetAllSexualAnimations(int actors = 2)
	int animations
	animations = ODatabase.getDatabaseOArray()
	animations = odatabase.getAnimationsWithActorCount(animations, actors)
	animations = odatabase.getHubAnimations(animations, false)
	animations = odatabase.getTransitoryAnimations(animations, false)

	return animations
EndFunction

String Function ReturnAnimationOfType(String type = "Any", Bool threesome = False)
	if (threesome)
    	int animations = GetAllSexualAnimations(3)
	Else
		int animations = GetAllSexualAnimations(2)
	endif

    ; Filter for keyword
    If		(type == "Any")
        int animation = Odatabase.GetObjectOArray(animations, utility.RandomInt(0, Odatabase.getLengthOArray(animations)))
        return odatabase.getSceneId(animation)
    ElseIf  (Type == "MFF")
        animations = ODatabase.GetAnimationsFromModule(animations, "B3P")
    ElseIf  (Type == "MMF")
        animations = ODatabase.GetAnimationsFromModule(animations, "0M2F")
    ElseIf  (Type == "Anal")
        animations = ODatabase.GetAnimationsWithAnimationClass(animations, "An")
    ElseIf  (Type == "Vaginal")
        animations = ODatabase.GetAnimationsWithAnimationClass(animations, "Sx")
    ElseIf  (Type == "Cunnilingus")
        int cunAnims1 = animations
        int cunAnims2 = animations

        cunAnims1 = ODatabase.GetAnimationsWithAnimationClass(animations, "VJ")
        cunAnims2 = ODatabase.GetAnimationsWithAnimationClass(animations, "VBJ")
        animations = QuickMergeOArray(cunAnims1, cunAnims2)
    ElseIf  (Type == "Oral")
        int bjAnims1 = animations
        int bjAnims2 = animations

        bjAnims1 =   ODatabase.GetAnimationsWithAnimationClass(animations, "BJ")
        bjAnims2 =   ODatabase.GetAnimationsWithAnimationClass(animations, "ApPj")
        animations = ODatabase.GetAnimationsWithAnimationClass(animations, "ApBj")
        animations = QuickMergeOArray(bjAnims1, bjAnims2, animations)
    ElseIf  (Type == "Fist")
        int fistAnims = animations

        fistAnims =  ODatabase.GetAnimationsWithAnimationClass(animations, "Pf1")
        animations = ODatabase.GetAnimationsWithAnimationClass(animations, "Pf2")
        animations = QuickMergeOArray(fistAnims, animations)
    ElseIf  (Type == "Cowgirl")
        animations = ODatabase.GetAnimationsWithName(animations, "cow", AllowPartialResult = True)
    ElseIf  (Type == "Behind" || "Doggy")
        animations = ODatabase.GetAnimationsWithName(animations, "dog", AllowPartialResult = True)
    Else
		Debug.Notification("Sexlab Solutions - Ostim failed to find valid scene. Notify dev.")
        return "Fail"
    EndIf

    If (Odatabase.getLengthOArray(animations) <= 0 && threesome == True) ;if animations is empty (ie there are none)
		animations = ODatabase.GetAnimationsWithActorCount(animations, 3)
		int animation = Odatabase.GetObjectOArray(animations, utility.RandomInt(0, Odatabase.getLengthOArray(animations)))
        return odatabase.getSceneId(animation)
	ElseIf (Odatabase.getLengthOArray(animations) <= 0 && threesome == False)
		animations = ODatabase.GetAnimationsWithActorCount(animations, 2)
		int animation = Odatabase.GetObjectOArray(animations, utility.RandomInt(0, Odatabase.getLengthOArray(animations)))
        return odatabase.getSceneId(animation)
    Else
        int animation = Odatabase.GetObjectOArray(animations, utility.RandomInt(0, Odatabase.getLengthOArray(animations)))
        return odatabase.getSceneId(animation)
    EndIf
EndFunction

int Function QuickMergeOArray(Int OArray1, Int OArray2, Int OArray3 = -69)
	If (OArray3 != -69)
		int[] Merge = new Int[3]
		Merge[0] = OArray1
		Merge[1] = OArray2
		Merge[2] = OArray3
		int MergedOArray = ODatabase.MergeOArrays(Merge)
		return MergedOArray
	Else
		int[] Merge = new Int[2]
		Merge[0] = OArray1
		Merge[1] = OArray2
		int MergedOArray = ODatabase.MergeOArrays(Merge)
		return MergedOArray
	EndIf
EndFunction

Actor Function GetFollowerForScene(bool partnerFemale)
	Actor zManualFollower = SSv3ManualPlayerFollower.GetReference() as Actor
	Actor zFollower = Follower.GetReference() as Actor
	If ((zManualFollower != None) && (zManualFollower.Is3dLoaded()))
		If (Ostim.IsFemale(zManualFollower) == true)
			If (SSv3MCM.op_femaleFollowerForFemale == True && partnerFemale == True) || (SSv3MCM.op_femaleFollowerForMale == True && partnerFemale == False)
				; Return if follower is female, and a mcm setting for female follower replacement is enabled.
				return zManualFollower
			endIf
		Else
			If (SSv3MCM.op_maleFollowerForFemale == True && partnerFemale == True) || (SSv3MCM.op_maleFollowerForMale == True && partnerFemale == False)
				return zManualFollower
			endIf
		EndIf
	elseIf((zFollower != None) && (zFollower.Is3dLoaded()))
		If (Ostim.IsFemale(zFollower) == true)
			If (SSv3MCM.op_femaleFollowerForFemale == True && partnerFemale == True) || (SSv3MCM.op_femaleFollowerForMale == True && partnerFemale == False)
				; Return if follower is female, and a mcm setting for female follower replacement is enabled.
				return zFollower
			endIf
		Else
			If (SSv3MCM.op_maleFollowerForFemale == True && partnerFemale == True) || (SSv3MCM.op_maleFollowerForMale == True && partnerFemale == False)
				return zFollower
			endIf
		EndIf
	Else
		return None
	EndIf
EndFunction

Function SexForTwo(Actor partner, String context = "mutual", String type = "Any", int victim = -1, bool aggressive = false, bool allowLeadIn = true)	
	String anim = ReturnAnimationOfType(type, False)
	Bool playerFemale = Ostim.IsFemale(PlayerRef)
	Bool partnerFemale = Ostim.IsFemale(partner)
	Bool playerVictim = false
	Bool partnerVictim = false

	; Find out if follower should be used in this scene. Will return != None if they should be used.
	Actor followerRef = GetFollowerForScene(partnerFemale)
	If (followerRef != None)
		; Swap player with follower.
		PlayerRef = followerRef
		playerFemale = Ostim.isFemale(followerRef)
	EndIf
	If (context == "pleasuring")
		OStim.StartScene(partner, playerref, zstartinganimation = anim) 
	ElseIf (context == "pleasured")
		OStim.StartScene(PlayerRef, partner, zstartinganimation = anim) 
	Else
		OStim.StartScene(PlayerRef, partner, zstartinganimation = anim)
	EndIf
	while(OStim.AnimationRunning())
		utility.wait(1.0)
	endWhile
EndFunction

Function SexForThree(Actor partner1, Actor partner2, String context = "mutual", String type = "Any", int victim = -1, bool aggressive = false, bool allowLeadIn = true)
	String anim = ReturnAnimationOfType(type, True)
	Bool playerFemale = Ostim.IsFemale(PlayerRef)
	Bool partnerFemale = Ostim.IsFemale(partner1)
	Bool playerVictim = false
	Bool partnerVictim = false
	
	; Find out if follower should be used in this scene. Will return != None if they should be used.
	Actor followerRef = GetFollowerForScene(partnerFemale)
	
	If (followerRef != None)
		; Swap player with follower.
		PlayerRef = followerRef
		playerFemale = Ostim.isFemale(followerRef)
	EndIf
	
	If (context == "pleasuring")
		OStim.StartScene(Dom=partner1, Sub=PlayerRef, zThirdActor=partner2 zstartinganimation=anim) 
	ElseIf (context == "pleasured")
		OStim.StartScene(Dom=PlayerRef, Sub=partner1, zThirdActor=partner2, zstartinganimation=anim) 
	Else
		OStim.StartScene(Dom=PlayerRef, Sub=partner1, zThirdActor=partner2, zstartinganimation=anim)
	EndIf
	while(OStim.AnimationRunning())
		utility.wait(1.0)
	endWhile
EndFunction

Function CreatureSexForTwo(Actor partner, bool victim = true, string hook = "None")
	Debug.TraceAndBox("Sorry, OStim doesn't support creature animations. Just imagine one happened here I guess.")
EndFunction

Function CreatureSexForThree(Actor partner1, Actor partner2, bool victim = true, string hook = "None")
	Debug.TraceAndBox("Sorry, OStim doesn't support creature animations. Just imagine one happened here I guess.")
EndFunction