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
	int animations
	if (threesome)
    	animations = GetAllSexualAnimations(3)
	Else
		animations = GetAllSexualAnimations(2)
	endif

	Int ret = Jmap.Object()

    ; Filter for keyword
    If  (Type == "MFF")
        JArray.addfromArray(ret, ODatabase.GetAnimationsFromModule(animations, "B3P"))
    ElseIf  (Type == "MMF")
        JArray.addfromArray(ret, ODatabase.GetAnimationsFromModule(animations, "0M2F"))
    ElseIf  (Type == "Anal")
        JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "An"))
    ElseIf  (Type == "Vaginal")
        JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "Sx"))
    ElseIf  (Type == "Cunnilingus")
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "VJ"))
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "VBJ"))
    ElseIf  (Type == "Oral")
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "BJ"))
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "ApPj"))
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "ApBj"))
    ElseIf  (Type == "Fist")
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "Pf1"))
		JArray.addfromArray(ret, ODatabase.GetAnimationsWithAnimationClass(animations, "Pf2"))
    ElseIf  (Type == "Cowgirl")
        JArray.addfromArray(ret, ODatabase.GetAnimationsWithName(animations, "cow", AllowPartialResult = True))
    ElseIf  (Type == "Behind" || "Doggy")
        JArray.addFromArray(ret, ODatabase.GetAnimationsWithName(animations, "dog", AllowPartialResult = True))
    Else
		Debug.Notification("OStim Solutions - Failed to find valid animation. Check console for more info.")
		ConsoleUtil.PrintMessage("OStim Solutions: Failed to find a valid animation with the anim tag: "+type)
		ConsoleUtil.PrintMessage("OStim Solutions: This is likely because you don't have threesome animations installed, but can also be thrown because of scene errors or an Ostim bug.")
        return ""
    EndIf

	If (Odatabase.getLengthOArray(ret) <= 0 && threesome == True) ;if ret is empty (ie there are none)
		ret = ODatabase.GetAnimationsWithActorCount(ret, 3)
		int animation = Odatabase.GetObjectOArray(ret, utility.RandomInt(0, Odatabase.getLengthOArray(ret)))
		return odatabase.getSceneId(animation)
	ElseIf (Odatabase.getLengthOArray(ret) <= 0 && threesome == False)
		ret = ODatabase.GetAnimationsWithActorCount(ret, 2)
		int animation = Odatabase.GetObjectOArray(ret, utility.RandomInt(0, Odatabase.getLengthOArray(ret)))
		return odatabase.getSceneId(animation)
	Else
		int animation = Odatabase.GetObjectOArray(ret, utility.RandomInt(0, Odatabase.getLengthOArray(ret)))
		return odatabase.getSceneId(animation)
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
	string anim = ""
	if (type != "Any") ; Save processing for starting anim if scene is generic, and instead start with basic start scene.
		anim = ReturnAnimationOfType(type, False)
	endif

	Bool playerFemale = Ostim.IsFemale(PlayerRef)
	Bool partnerFemale = Ostim.IsFemale(partner)
	actor playerOrFollower = playerRef
	Bool playerVictim = false
	Bool partnerVictim = false

	; Find out if follower should be used in this scene. Will return != None if they should be used.
	Actor followerRef = GetFollowerForScene(partnerFemale)
	If (followerRef != None)
		; Swap player with follower.
		playerOrFollower = followerRef
		playerFemale = Ostim.isFemale(followerRef)
	EndIf
	If (context == "pleasuring")
		OStim.StartScene(partner, playerOrFollower, zstartinganimation = anim) 
	ElseIf (context == "pleasured")
		OStim.StartScene(playerOrFollower, partner, zstartinganimation = anim) 
	Else
		OStim.StartScene(playerOrFollower, partner, zstartinganimation = anim)
	EndIf
	while(OStim.AnimationRunning())
		utility.wait(1.0)
	endWhile
EndFunction

Function SexForThree(Actor partner1, Actor partner2, String context = "mutual", String type = "Any", int victim = -1, bool aggressive = false, bool allowLeadIn = true)
	string anim = ""
	if (type != "Any") ; Save processing for starting anim if scene is generic, and instead start with basic start scene.
		anim = ReturnAnimationOfType(type, False)
	endif
	
	Bool playerFemale = Ostim.IsFemale(PlayerRef)
	Bool partnerFemale = Ostim.IsFemale(partner1)
	actor playerOrFollower = playerRef
	Bool playerVictim = false
	Bool partnerVictim = false
	
	; Find out if follower should be used in this scene. Will return != None if they should be used.
	Actor followerRef = GetFollowerForScene(partnerFemale)
	
	If (followerRef != None)
		; Swap player with follower.
		playerOrFollower = followerRef
		playerFemale = Ostim.isFemale(followerRef)
	EndIf
	
	If (context == "pleasuring")
		OStim.StartScene(Dom=partner1, Sub=playerOrFollower, zThirdActor=partner2, zstartinganimation=anim) 
	ElseIf (context == "pleasured")
		OStim.StartScene(Dom=playerOrFollower, Sub=partner1, zThirdActor=partner2, zstartinganimation=anim) 
	Else
		OStim.StartScene(Dom=playerOrFollower, Sub=partner1, zThirdActor=partner2, zstartinganimation=anim)
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