Scriptname SSv2OrcPlaythingScript extends Quest  

ssv2qscript Property SSv2q  Auto  


Function startCooldown()

	SSv2Q.OrcDemand = 1
	
	float cooldownDuration = 6.0
	if SSv2Q.OrcSlut >= 1
		cooldownDuration = ( 24.0 / SSv2Q.OrcSlut )
	EndIf
	
	RegisterForSingleUpdateGameTime(cooldownDuration)

EndFunction


Event onUpdateGameTime()
	SSv2Q.OrcDemand = 0
EndEvent