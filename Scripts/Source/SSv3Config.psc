Scriptname SSv3Config extends ski_configbase Conditional

SPELL Property SSv3FollowerTagSpell  Auto  

;Animations Page
Int animsStraightHeader_OID_H
Int animsStraightForeplay_OID_B
Int animsStraightContextual_OID_B
Int animsStraightPositioning_OID_T
Int animsLesbianHeader_OID_H
Int animsLesbianForeplay_OID_B
Int animsLesbianContextual_OID_B
Int animsLesbianPositioning_OID_T
Int animsGayHeader_OID_H
Int animsGayForeplay_OID_B
Int animsGayContextual_OID_B
Int animsGayPositioning_OID_T

;---

Bool Property op_StraightForeplay = true Auto
Bool Property op_StraightContextual = true Auto
Bool Property op_StraightPositioning = true Auto
Bool Property op_LesbianForeplay = true Auto
Bool Property op_LesbianContextual = true Auto
Bool Property op_LesbianPositioning = true Auto
Bool Property op_GayForeplay = true Auto
Bool Property op_GayContextual = false Auto
Bool Property op_GayPositioning = true Auto

;======================================

;Follower Page
Int femaleFollowerForMale_OID_B
Int femaleFollowerForFemale_OID_B
Int maleFollowerForMale_OID_B
Int maleFollowerForFemale_OID_B
Int followerTagSpell_OID_B

;---

Bool Property op_femaleFollowerForMale = false Auto
Bool Property op_femaleFollowerForFemale = false Auto
Bool Property op_maleFollowerForMale = false Auto
Bool Property op_maleFollowerForFemale = false Auto
Bool Property op_followerTagSpell = false Auto


;======================================

;Miscellaneous Page
Int flairHeader_OID_H
Int flairToggle_OID_B
Int theftHeader_OID_H
int goldTheftLimit_OID_S
int gearTheftPercentage_OID_S

Int eventTogglesHeader_OID_H
Int eventBeggars_OID_B
Int eventDrunks_OID_B
Int eventVampires_OID_B
Int eventHousecarls_OID_B
Int eventEbonyBlade_OID_B
Int eventOrcOverride_OID_B
Int ExportSettings
Int ImportSettings
Int OstimIncompatibleFeaturesFlag

;---

Bool Property op_flairToggle = true Auto
float Property op_goldTheftLimit = 10000.0 Auto
float Property op_gearTheftPercentage = 25.0 Auto

int Property op_eventBeggars = 1 Auto Conditional
int Property op_eventDrunks = 1 Auto Conditional
int Property op_eventVampires = 1 Auto Conditional
int Property op_eventHousecarls = 1 Auto Conditional
int Property op_eventEbonyBlade = 1 Auto Conditional
int Property op_eventOrcOverride = 0 Auto Conditional

Int function GetVersion()
	return 7
endFunction

function OnVersionUpdate(Int a_version)
{Called when a version update of this script has been detected}

	if a_version >= GetVersion() && CurrentVersion < GetVersion()
		debug.Trace(self as String + ": Updating script to version " + a_version, 0)
		OnConfigInit()
		Debug.Notification("SexLab Solutions - Ostim MCM updated to version " + a_version)
	endIf
endFunction


function OnConfigInit()

	Pages = new String[3]
	Pages[0] = "Animations"
	Pages[1] = "Follower"
	Pages[2] = "Miscellaneous"

endFunction


function OnPageReset(String a_page)
{Called when a new page is selected, including the initial empty page}
	OstimIncompatibleFeaturesFlag = OPTION_FLAG_DISABLED
	if a_page == ""
		;self.LoadCustomContent("SexLabSolutions/SexLabSolutionsLogo.dds", 165 as Float, -20 as Float)
		return 
	else
		;self.UnloadCustomContent()
	endIf
	if a_page == "Animations"
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetTitleText("Animations")
		
		;Straight Section
		animsStraightHeader_OID_H = self.AddHeaderOption("Straight Animations")
		animsStraightForeplay_OID_B = AddToggleOption("Allow Foreplay", op_StraightForeplay, OstimIncompatibleFeaturesFlag)
		animsStraightContextual_OID_B = AddToggleOption("Contextual Animations", op_StraightContextual, OstimIncompatibleFeaturesFlag)
		If op_StraightPositioning == true
			animsStraightPositioning_OID_T = AddTextOption("Default Positions", "Vanilla", OstimIncompatibleFeaturesFlag)
		Else
			animsStraightPositioning_OID_T = AddTextOption("Default Positions", "Pegging", OstimIncompatibleFeaturesFlag)
		EndIf
		
		;Lesbian Section
		animsLesbianHeader_OID_H = self.AddHeaderOption("Lesbian Animations")
		animsLesbianForeplay_OID_B = AddToggleOption("Allow Foreplay", op_LesbianForeplay, OstimIncompatibleFeaturesFlag)
		animsLesbianContextual_OID_B = AddToggleOption("Contextual Animations", op_LesbianContextual, OstimIncompatibleFeaturesFlag)
		If op_LesbianPositioning == true
			animsLesbianPositioning_OID_T = AddTextOption("Default Positions", "Player Receiving", OstimIncompatibleFeaturesFlag)
		Else
			animsLesbianPositioning_OID_T = AddTextOption("Default Positions", "Player Giving", OstimIncompatibleFeaturesFlag)
		EndIf
		
		;Gay Section
		animsGayHeader_OID_H = self.AddHeaderOption("Gay Animations")
		animsGayForeplay_OID_B = AddToggleOption("Allow Foreplay", op_GayForeplay, OstimIncompatibleFeaturesFlag)
		animsGayContextual_OID_B = AddToggleOption("Contextual Animations", op_GayContextual, OstimIncompatibleFeaturesFlag)
		If op_GayPositioning == true
			animsGayPositioning_OID_T = AddTextOption("Default Positions", "Player Top", OstimIncompatibleFeaturesFlag)
		Else
			animsGayPositioning_OID_T = AddTextOption("Default Positions", "Player Bottom", OstimIncompatibleFeaturesFlag)
		EndIf
		
	elseIf a_page == "Follower"
		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetTitleText("Follower")
		femaleFollowerForMale_OID_B = AddToggleOption("Use female follower for males", op_femaleFollowerForMale)
		femaleFollowerForFemale_OID_B = AddToggleOption("Use female follower for females", op_femaleFollowerForFemale)
		maleFollowerForMale_OID_B = AddToggleOption("Use male follower for males", op_maleFollowerForMale)
		maleFollowerForFemale_OID_B = AddToggleOption("Use male follower for females", op_maleFollowerForFemale)
		followerTagSpell_OID_B = AddToggleOption("Manual follower tagging spell", op_followerTagSpell)
		
	elseIf a_page == "Miscellaneous"

		self.SetCursorFillMode(self.TOP_TO_BOTTOM)
		self.SetTitleText("Miscellaneous")
		flairHeader_OID_H = self.AddHeaderOption("Text notifications")
		flairToggle_OID_B = AddToggleOption("Display text flair", op_flairToggle)
		theftHeader_OID_H = self.AddHeaderOption("Theft")
		goldTheftLimit_OID_S = self.AddSliderOption("Gold theft limit", op_goldTheftLimit, "{0}", 0)
		gearTheftPercentage_OID_S = self.AddSliderOption("Gear theft percentage", op_gearTheftPercentage, "{0}%", 0)
		
		eventTogglesHeader_OID_H = self.AddHeaderOption("Generic Event Toggles")
		eventBeggars_OID_B = AddToggleOption("Beggars", GetConditionalState(op_eventBeggars))
		eventDrunks_OID_B = AddToggleOption("Drunks", GetConditionalState(op_eventDrunks))
		eventVampires_OID_B = AddToggleOption("Vampires", GetConditionalState(op_eventVampires))
		eventHousecarls_OID_B = AddToggleOption("Housecarls", GetConditionalState(op_eventHousecarls))
		eventEbonyBlade_OID_B = AddToggleOption("Ebony Blade", GetConditionalState(op_eventEbonyBlade))
		eventOrcOverride_OID_B = AddToggleOption("Orc Override", GetConditionalState(op_eventOrcOverride))
		AddHeaderOption("Save and Load MCM")
		ExportSettings = AddTextOption("Export Settings", "Done")
		ImportSettings = AddTextOption("Import Settings", "Done")
		SetCursorPosition(1)
		AddHeaderOption("Integration")
	EndIf
endFunction


event OnOptionHighlight(int option)

	If(option == animsStraightForeplay_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Toggles whether straight sex scenes in SexLab Solutions are allowed to start with a foreplay animation, if you have it enabled in the SexLab framework options.")
	ElseIf(option == animsStraightContextual_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Scenes involving a male and female actor will attempt to pick from a mix of vaginal, anal and oral animations, when the scene doesn't specify a required animation type. If disabled, will ignore genders and randomly pick any enabled animation.")
	ElseIf(option == animsStraightPositioning_OID_T)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Sets the default actor roles for consensual straight scenes that don't specify a required positioning.")
	ElseIf(option == animsLesbianForeplay_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Toggles whether lesbian sex scenes in SexLab Solutions are allowed to start with a foreplay animation, if you have it enabled in the SexLab framework options.")
	ElseIf(option == animsLesbianContextual_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Scenes involving two female actors will attempt to use lesbian animations, when the scene doesn't specify a required animation type. If disabled, will ignore genders and randomly pick any enabled animation.")
	ElseIf(option == animsLesbianPositioning_OID_T)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Sets the default actor roles for consensual lesbian scenes that don't specify a required positioning.")
	ElseIf(option == animsGayForeplay_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Toggles whether gay sex scenes in SexLab Solutions are allowed to start with a foreplay animation, if you have it enabled in the SexLab framework options.")
	ElseIf(option == animsGayContextual_OID_B)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Scenes involving two male actors will attempt to pick from a mix of anal and oral animations, when the scene doesn't specify a required animation type. If disabled, will ignore genders and randomly pick any enabled animation.")
	ElseIf(option == animsGayPositioning_OID_T)
		SetInfoText("Disabled for Sexlab Solutions - Ostim")
		;SetInfoText("Sets the default actor roles for consensual gay scenes that don't specify a required positioning.")
		
	ElseIf(option == femaleFollowerForMale_OID_B)
		SetInfoText("If the player has a female follower and the scene involves a male actor, the follower will take the place of the player in the animation.")	
	ElseIf(option == femaleFollowerForFemale_OID_B)
		SetInfoText("If the player has a female follower and the scene involves a female actor, the follower will take the place of the player in the animation.")		
	ElseIf(option == maleFollowerForMale_OID_B)
		SetInfoText("If the player has a male follower and the scene involves a male actor, the follower will take the place of the player in the animation.")		
	ElseIf(option == maleFollowerForFemale_OID_B)
		SetInfoText("If the player has a male follower and the scene involves a female actor, the follower will take the place of the player in the animation.")		
	ElseIf(option == followerTagSpell_OID_B)
		SetInfoText("Adds or removes a follower tagging spell to the player. Use it if the mod is not automatically recognizing your follower.")
		
	ElseIf(option == flairToggle_OID_B)
		SetInfoText("Enable text notifications at the end of a scene.")
	ElseIf(option == goldTheftLimit_OID_S)
		SetInfoText("Maximum amount of gold an NPC can steal from you in a robbery scene. (Set to 0 to disable)")
	ElseIf(option == gearTheftPercentage_OID_S)
		SetInfoText("Average percentage of gear taken by a thief in a robbery scene. (Set to 0 to disable)")
	ElseIf(option == eventBeggars_OID_B)
		SetInfoText("Enable sex dialogue for beggars.")
	ElseIf(option == eventDrunks_OID_B)
		SetInfoText("Enable sex dialogue for drunks.")
	ElseIf(option == eventVampires_OID_B)
		SetInfoText("Enable sex dialogue for vampires.")
	ElseIf(option == eventHousecarls_OID_B)
		SetInfoText("Enable sex dialogue for housecarls.")
	ElseIf(option == eventEbonyBlade_OID_B)
		SetInfoText("Enable sex dialogue for Ebony Blade victims.")
	ElseIf(option == eventOrcOverride_OID_B)
		SetInfoText("Provides an alternative dialogue path to start the Orc plaything event if the player is already friendly with the Orc tribes. Should be disabled by default, to avoid duplicate dialogue options.")
	ElseIf(option == ExportSettings)
		SetInfoText("Click this button to export the Sexlab Solutions - Ostim MCM settings.")
	ElseIf(option == ImportSettings)
		SetInfoText("Click this button to export the Sexlab Solutions - Ostim MCM settings.")
	EndIf
endEvent

; ================ TOGGLES SECTION - START

Event OnOptionSelect(int option)

	If(option == animsStraightForeplay_OID_B)
		op_StraightForeplay = !op_StraightForeplay
		SetToggleOptionValue(animsStraightForeplay_OID_B, op_StraightForeplay)
	ElseIf(option == animsStraightContextual_OID_B)
		op_StraightContextual = !op_StraightContextual
		SetToggleOptionValue(animsStraightContextual_OID_B, op_StraightContextual)
	ElseIf(option == animsStraightPositioning_OID_T)
		op_StraightPositioning = !op_StraightPositioning
		If op_StraightPositioning == true
			SetTextOptionValue(animsStraightPositioning_OID_T, "Vanilla")
		Else
			SetTextOptionValue(animsStraightPositioning_OID_T, "Pegging")
		EndIf
	ElseIf(option == animsLesbianForeplay_OID_B)
		op_LesbianForeplay = !op_LesbianForeplay
		SetToggleOptionValue(animsLesbianForeplay_OID_B, op_LesbianForeplay)
	ElseIf(option == animsLesbianContextual_OID_B)
		op_LesbianContextual = !op_LesbianContextual
		SetToggleOptionValue(animsLesbianContextual_OID_B, op_LesbianContextual)
	ElseIf(option == animsLesbianPositioning_OID_T)
		op_LesbianPositioning = !op_LesbianPositioning
		If op_LesbianPositioning == true
			SetTextOptionValue(animsLesbianPositioning_OID_T, "Player Receiving")
		Else
			SetTextOptionValue(animsLesbianPositioning_OID_T, "Player Giving")
		EndIf
	ElseIf(option == animsGayForeplay_OID_B)
		op_GayForeplay = !op_GayForeplay
		SetToggleOptionValue(animsGayForeplay_OID_B, op_GayForeplay)
	ElseIf(option == animsGayContextual_OID_B)
		op_GayContextual = !op_GayContextual
		SetToggleOptionValue(animsGayContextual_OID_B, op_GayContextual)
	ElseIf(option == animsGayPositioning_OID_T)
		op_GayPositioning = !op_GayPositioning
		If op_GayPositioning == true
			SetTextOptionValue(animsGayPositioning_OID_T, "Player Top")
		Else
			SetTextOptionValue(animsGayPositioning_OID_T, "Player Bottom")
		EndIf
		
	ElseIf(option == femaleFollowerForMale_OID_B)
		op_femaleFollowerForMale = !op_femaleFollowerForMale
		SetToggleOptionValue(femaleFollowerForMale_OID_B, op_femaleFollowerForMale)
	ElseIf(option == femaleFollowerForFemale_OID_B)
		op_femaleFollowerForFemale = !op_femaleFollowerForFemale
		SetToggleOptionValue(femaleFollowerForFemale_OID_B, op_femaleFollowerForFemale)
	ElseIf(option == maleFollowerForMale_OID_B)
		op_maleFollowerForMale = !op_maleFollowerForMale
		SetToggleOptionValue(maleFollowerForMale_OID_B, op_maleFollowerForMale)
	ElseIf(option == maleFollowerForFemale_OID_B)
		op_maleFollowerForFemale = !op_maleFollowerForFemale
		SetToggleOptionValue(maleFollowerForFemale_OID_B, op_maleFollowerForFemale)
	ElseIf(option == followerTagSpell_OID_B)
		op_followerTagSpell = !op_followerTagSpell
		SetToggleOptionValue(followerTagSpell_OID_B, op_followerTagSpell)
		if (op_followerTagSpell)
			Game.GetPlayer().AddSpell(SSv3FollowerTagSpell)
		Else
			Game.GetPlayer().RemoveSpell(SSv3FollowerTagSpell)
		EndIf
		
	ElseIf(option == flairToggle_OID_B)
		op_flairToggle = !op_flairToggle
		SetToggleOptionValue(flairToggle_OID_B, op_flairToggle)
	ElseIf(option == eventBeggars_OID_B)
		op_eventBeggars = FlipConditionalState(op_eventBeggars)
		SetToggleOptionValue(eventBeggars_OID_B, GetConditionalState(op_eventBeggars))
	ElseIf(option == eventDrunks_OID_B)
		op_eventDrunks = FlipConditionalState(op_eventDrunks)
		SetToggleOptionValue(eventDrunks_OID_B, GetConditionalState(op_eventDrunks))
	ElseIf(option == eventVampires_OID_B)
		op_eventVampires = FlipConditionalState(op_eventVampires)
		SetToggleOptionValue(eventVampires_OID_B, GetConditionalState(op_eventVampires))
	ElseIf(option == eventHousecarls_OID_B)
		op_eventHousecarls = FlipConditionalState(op_eventHousecarls)
		SetToggleOptionValue(eventHousecarls_OID_B, GetConditionalState(op_eventHousecarls))
	ElseIf(option == eventEbonyBlade_OID_B)
		op_eventEbonyBlade = FlipConditionalState(op_eventEbonyBlade)
		SetToggleOptionValue(eventEbonyBlade_OID_B, GetConditionalState(op_eventEbonyBlade))
	ElseIf(option == eventOrcOverride_OID_B)
		op_eventOrcOverride = FlipConditionalState(op_eventOrcOverride)
		SetToggleOptionValue(eventOrcOverride_OID_B, GetConditionalState(op_eventOrcOverride))
	ElseIf(Option == ExportSettings)
		ExportSettings()
	ElseIf(Option == ImportSettings)
		ImportSettings()
	EndIf

EndEvent

; ================ TOGGLES SECTION - END



; ================ SLIDERS SECTION - START

function OnOptionSliderOpen(Int option)

	If option == goldTheftLimit_OID_S
		self.SetSliderDialogStartValue(op_goldTheftLimit)
		self.SetSliderDialogDefaultValue(10000)
		self.SetSliderDialogRange(0, 20000)
		self.SetSliderDialogInterval(100)
	ElseIf option == gearTheftPercentage_OID_S
		self.SetSliderDialogStartValue(op_gearTheftPercentage)
		self.SetSliderDialogDefaultValue(25)
		self.SetSliderDialogRange(0, 100)
		self.SetSliderDialogInterval(1)
	EndIf
EndFunction


function OnOptionSliderAccept(Int option, Float value)
	if option == goldTheftLimit_OID_S
		op_goldTheftLimit = value
		self.SetSliderOptionValue(goldTheftLimit_OID_S, op_goldTheftLimit, "{0}", false)
	elseIf option == gearTheftPercentage_OID_S
		op_gearTheftPercentage = value
		self.SetSliderOptionValue(gearTheftPercentage_OID_S, op_gearTheftPercentage, "{0}%", false)
	EndIf
EndFunction

; ================ SLIDERS SECTION - END



;Helper functions to translate between boolean toggles and integer conditionals for use in dialogue
int Function FlipConditionalState(int conditional)
	If (conditional == 1)
		return 0
	Else
		return 1
	EndIf
EndFunction

bool Function GetConditionalState(int conditional)
	If (conditional == 1)
		return true
	Else
		return false
	EndIf
EndFunction

; ================ Export / Import MCM - START

Function ExportSettings()
	int SexLabSolutionsSettingsFile = Jmap.Object()

	Debug.MessageBox("Exporting to file, wait a second or two before clicking OK.")

	JMap.SetInt(SexLabSolutionsSettingsFile, "op_StraightForeplay", op_StraightForeplay as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_StraightContextual", op_StraightContextual as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_StraightPositioning", op_StraightPositioning as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_LesbianForeplay", op_LesbianForeplay as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_LesbianContextual", op_LesbianContextual as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_LesbianPositioning", op_LesbianPositioning as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_GayForeplay", op_GayForeplay as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_GayContextual", op_GayContextual as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_GayPositioning", op_GayPositioning as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_femaleFollowerForMale", op_femaleFollowerForMale as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_femaleFollowerForFemale", op_femaleFollowerForFemale as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_maleFollowerForMale", op_maleFollowerForMale as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_maleFollowerForFemale", op_maleFollowerForFemale as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_followerTagSpell", op_followerTagSpell as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_flairToggle", op_flairToggle as Int)

	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventBeggars", op_eventBeggars as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventDrunks", op_eventDrunks as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventVampires", op_eventVampires as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventHousecarls", op_eventHousecarls as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventEbonyBlade", op_eventEbonyBlade as Int)
	JMap.SetInt(SexLabSolutionsSettingsFile, "op_eventOrcOverride", op_eventOrcOverride as Int)

	JMap.SetFlt(SexLabSolutionsSettingsFile ,"op_goldTheftLimit", op_goldTheftLimit as Float)
	JMap.SetFlt(SexLabSolutionsSettingsFile ,"op_gearTheftPercentage", op_gearTheftPercentage as Float)

	Jvalue.WriteToFile(SexLabSolutionsSettingsFile, "TestSexLabSolutionsSettingsFile.json")

	ForcePageReset()
EndFunction

Function ImportSettings()
	Int SexLabSolutionsSettingsFile = Jvalue.ReadFromFile(JContainers.UserDirectory() + "SexLabSolutionsSettingsFile.json")
	Int TestSexLabSolutionsSettingsFile = Jvalue.ReadFromFile("TestSexLabSolutionsSettingsFile.json")
	if (SexLabSolutionsSettingsFile == False && TestSexLabSolutionsSettingsFile == False)
		Debug.MessageBox("Tried to import from file, but no file existed.")
		return
	ElseIf (SexLabSolutionsSettingsFile == False && TestSexLabSolutionsSettingsFile == True)
		SexLabSolutionsSettingsFile = TestSexLabSolutionsSettingsFile
		Debug.MessageBox("Importing from file, wait a second or two before clicking OK.")
	Else
		Debug.MessageBox("Importing from file, wait a second or two before clicking OK.")
	EndIf

	op_StraightForeplay = JMap.GetInt(SexLabSolutionsSettingsFile, "op_StraightForeplay")
	op_StraightContextual = JMap.GetInt(SexLabSolutionsSettingsFile, "op_StraightContextual")
	op_StraightPositioning = JMap.GetInt(SexLabSolutionsSettingsFile, "op_StraightPositioning")
	op_LesbianForeplay = JMap.GetInt(SexLabSolutionsSettingsFile, "op_LesbianForeplay")
	op_LesbianContextual = JMap.GetInt(SexLabSolutionsSettingsFile, "op_LesbianContextual")
	op_LesbianPositioning = JMap.GetInt(SexLabSolutionsSettingsFile, "op_LesbianPositioning")
	op_GayForeplay = JMap.GetInt(SexLabSolutionsSettingsFile, "op_GayForeplay")
	op_GayContextual = JMap.GetInt(SexLabSolutionsSettingsFile, "op_GayContextual")
	op_GayPositioning = JMap.GetInt(SexLabSolutionsSettingsFile, "op_GayPositioning")
	op_femaleFollowerForMale = JMap.GetInt(SexLabSolutionsSettingsFile, "op_femaleFollowerForMale")
	op_femaleFollowerForFemale = JMap.GetInt(SexLabSolutionsSettingsFile, "op_femaleFollowerForFemale")
	op_maleFollowerForMale = JMap.GetInt(SexLabSolutionsSettingsFile, "op_maleFollowerForMale")
	op_maleFollowerForFemale = JMap.GetInt(SexLabSolutionsSettingsFile, "op_maleFollowerForFemale")
	op_followerTagSpell = JMap.GetInt(SexLabSolutionsSettingsFile, "op_followerTagSpell")
	op_flairToggle = JMap.GetInt(SexLabSolutionsSettingsFile, "op_flairToggle")

	op_eventBeggars = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventBeggars")
	op_eventDrunks = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventDrunks")
	op_eventVampires = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventVampires")
	op_eventHousecarls = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventHousecarls")
	op_eventEbonyBlade = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventEbonyBlade")
	op_eventOrcOverride = JMap.GetInt(SexLabSolutionsSettingsFile, "op_eventOrcOverride")

	op_goldTheftLimit = JMap.GetFlt(SexLabSolutionsSettingsFile ,"op_goldTheftLimit")
	op_gearTheftPercentage = JMap.GetFlt(SexLabSolutionsSettingsFile ,"op_gearTheftPercentage")
	
	ForcePageReset()
EndFunction

; ================ Export / Import MCM - END