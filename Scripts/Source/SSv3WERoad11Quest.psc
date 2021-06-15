Scriptname SSv3WERoad11Quest extends Quest  

GlobalVariable Property SSv3_GiantSexMutex  Auto  
GlobalVariable Property SSv3_GiantCounter  Auto  

Function Initialize()
	SSv3_GiantCounter.SetValue(0)
	SSv3_GiantSexMutex.SetValue(0)
	startCountdown()
	Maintenance()
EndFunction

Function Maintenance()
	RegisterForModEvent("AnimationEnd_SolutionsWERoad11", "GiantSexDone")
EndFunction


Event GiantSexDone(string eventName, string argString, float argNum, form sender)
	int currentGiants = SSv3_GiantCounter.GetValue() As Int
	currentGiants += 1
	SSv3_GiantCounter.SetValue(currentGiants)
	SSv3_GiantSexMutex.SetValue(0)
	If getStage() < 10
		setStage(10)
	EndIf
EndEvent


Function startCountdown()
	RegisterForSingleUpdate(3600.0)
EndFunction


Event onUpdate()
	setStage(91)
EndEvent



