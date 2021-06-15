Scriptname SSv3_AssistJarlQuestScript extends Quest  

Quest Property Favor250  Auto  
Quest Property FreeformRiftenThane  Auto  
Quest Property Favor252  Auto  
Quest Property Favor253  Auto  
Quest Property Favor254  Auto  
Quest Property Favor255  Auto  
Quest Property Favor256  Auto  
Quest Property Favor257  Auto  
Quest Property Favor258  Auto  

Quest Property FavorJarlsMakeFriends  Auto  

ReferenceAlias Property AssistJarlDawnstar  Auto  
ReferenceAlias Property AssistJarlFalkreath  Auto  
ReferenceAlias Property AssistJarlMarkarth  Auto  
ReferenceAlias Property AssistJarlMorthal  Auto  
ReferenceAlias Property AssistJarlRiften  Auto  
ReferenceAlias Property AssistJarlSolitude  Auto  
ReferenceAlias Property AssistJarlWhiterun  Auto  
ReferenceAlias Property AssistJarlWindhelm  Auto  
ReferenceAlias Property AssistJarlWinterhold  Auto  

ReferenceAlias Property AssistJarlDawnstarRep  Auto  
ReferenceAlias Property AssistJarlFalkreathRep  Auto  
ReferenceAlias Property AssistJarlMarkarthRep  Auto  
ReferenceAlias Property AssistJarlMorthalRep  Auto  
ReferenceAlias Property AssistJarlRiftenRep  Auto  
ReferenceAlias Property AssistJarlSolitudeRep  Auto  
ReferenceAlias Property AssistJarlWhiterunRep  Auto  
ReferenceAlias Property AssistJarlWindhelmRep  Auto  
ReferenceAlias Property AssistJarlWinterholdRep  Auto  


Function CompleteAssistQuest(Actor Jarl)

	If Jarl == AssistJarlDawnstar.GetActorRef()
		If favor256.GetStage() < 10
			favor256.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(75) == False )
			FavorJarlsMakeFriends.SetStage(75)
		EndIf
		AssistJarlDawnstar.Clear()
		AssistJarlDawnstarRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlFalkreath.GetActorRef()
		If favor258.GetStage() < 10
			favor258.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(95) == False )
			FavorJarlsMakeFriends.SetStage(95)
		EndIf
		AssistJarlFalkreath.Clear()
		AssistJarlFalkreathRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlMarkarth.GetActorRef()
		If favor250.GetStage() < 10
			favor250.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(15) == False )
			FavorJarlsMakeFriends.SetStage(15)
		EndIf
		AssistJarlMarkarth.Clear()
		AssistJarlMarkarthRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlMorthal.GetActorRef()
		If favor255.GetStage() < 10
			favor255.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(65) == False )
			FavorJarlsMakeFriends.SetStage(65)
		EndIf
		AssistJarlMorthal.Clear()
		AssistJarlMorthalRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlRiften.GetActorRef()
		;/ ########################### THIS NEEDS FIXING IF ENABLED. FreeformRiftenThane does not use the same quest logic as the others.
		If FreeformRiftenThane.GetStage() < 10
			FreeformRiftenThane.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(25) == False )
			FavorJarlsMakeFriends.SetStage(25)
		EndIf
		AssistJarlRiften.Clear()
		AssistJarlRiftenRep.ForceRefTo(Jarl)
		/;
	ElseIf Jarl == AssistJarlSolitude.GetActorRef()
		If favor252.GetStage() < 10
			favor252.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(35) == False )
			FavorJarlsMakeFriends.SetStage(35)
		EndIf
		AssistJarlSolitude.Clear()
		AssistJarlSolitudeRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlWhiterun.GetActorRef()
		If favor253.GetStage() < 10
			favor253.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(45) == False )
			FavorJarlsMakeFriends.SetStage(45)
		EndIf
		AssistJarlWhiterun.Clear()
		AssistJarlWhiterunRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlWindhelm.GetActorRef()
		If favor254.GetStage() < 10
			favor254.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(55) == False )
			FavorJarlsMakeFriends.SetStage(55)
		EndIf
		AssistJarlWindhelm.Clear()
		AssistJarlWindhelmRep.ForceRefTo(Jarl)
	ElseIf Jarl == AssistJarlWinterhold.GetActorRef()
		If favor257.GetStage() < 10
			favor257.SetStage(10)
		EndIf
		Utility.Wait(0.5)
		If ( FavorJarlsMakeFriends.GetStageDone(85) == False )
			FavorJarlsMakeFriends.SetStage(85)
		EndIf
		AssistJarlWinterhold.Clear()
		AssistJarlWinterholdRep.ForceRefTo(Jarl)
	EndIf

EndFunction






