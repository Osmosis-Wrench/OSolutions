Scriptname SSv3_GiantScannerTriggerEffect extends activemagiceffect  

GlobalVariable Property SSv3_GiantSexMutex  Auto  
SPELL Property SSv3_GiantSatisfiedSpell  Auto  
MagicEffect Property SSv3_GiantSatisfiedEffect  Auto  
SSv3Handler Property Handler  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

	if (SSv3_GiantSexMutex.GetValue() == 0) && (akTarget.HasMagicEffect(SSv3_GiantSatisfiedEffect) == false)
		SSv3_GiantSexMutex.SetValue(1)
		SSv3_GiantSatisfiedSpell.Cast(akTarget,akTarget)
		Handler.CreatureSexForTwo(akTarget, victim=true, hook="SolutionsWERoad11")
	EndIf
	
EndEvent







