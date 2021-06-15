Scriptname SSv3_NPCRedwaterSetup extends ActiveMagicEffect  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      Properties block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Location property DLC1dunRedwaterDenLocation auto

Quest property DLC1dunRedwaterDenQST auto

ReferenceAlias Property CageVampire  Auto  

ReferenceAlias Property SSv3NPCRedwaterCageVampire  Auto  

int property maxStage = 20 auto

float property timeDelay = 7.0 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;       Event Block
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == game.getPlayer() && game.getPlayer().isInLocation(DLC1dunRedwaterDenLocation)
		;if used by the player and in the RedwaterDen Location
		if DLC1dunRedwaterDenQST.getStage() < maxStage
			utility.wait(timeDelay)
			Game.GetPlayer().RemoveAllItems(CageVampire.GetActorRef())
			SSv3NPCRedwaterCageVampire.ForceRefTo(CageVampire.GetActorRef())
		endif
	endif
endEvent





