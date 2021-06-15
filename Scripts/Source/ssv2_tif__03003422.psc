;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname ssv2_tif__03003422 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2.NPCThief = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

Game.DisablePlayerControls(1, 1, 0, 0, 0, 0, 1)
Debug.SendAnimationEvent(PlayerRef, "BleedOutStart")
Debug.Notification("The thief is taking some of your items!")

;clean transfer chest
transferChestWhiterunStablesDresser.RemoveAllItems(None, false, false)

;take money from player, give it to thief
int goldLimit = SSv3MCM.op_goldTheftLimit As Int
if goldLimit > 0
	int goldStolen = PlayerRef.GetGoldAmount()
	if goldStolen > goldLimit
		goldStolen = goldLimit
	EndIf
	PlayerRef.RemoveItem(Gold001, goldStolen, false, akSpeaker)
EndIf

;Gear theft section
float gearPercentageRemoved = SSv3MCM.op_gearTheftPercentage
If gearPercentageRemoved > 0
	;send all items off to temp chest, leaving quest items behind
	PlayerRef.RemoveAllItems(transferChestWhiterunStablesDresser, false, false)

	Form kForm
	int count
	int value
	int n = transferChestWhiterunStablesDresser.GetNumItems()
	while(n)
		n -= 1
		kForm = transferChestWhiterunStablesDresser.GetNthForm(n)
		value = kForm.GetGoldValue()
		
		if (value > 0 && (Utility.RandomFloat(0, 100) < gearPercentageRemoved))
			count = transferChestWhiterunStablesDresser.GetItemCount(kForm)
			transferChestWhiterunStablesDresser.RemoveItem(kForm, count, true, akSpeaker)
		Else
			count = transferChestWhiterunStablesDresser.GetItemCount(kForm)
			transferChestWhiterunStablesDresser.RemoveItem(kForm, count, true, PlayerRef)
		EndIf
	endWhile

	transferChestWhiterunStablesDresser.RemoveAllItems(PlayerRef, false, false)
EndIf

;sex scene
Handler.SexForTwo(akSpeaker, type="Aggressive", victim=0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



SSv2NPCScript Property SSv2  Auto  

ObjectReference Property transferChestWhiterunStablesDresser  Auto  

MiscObject Property Gold001  Auto  

SSv3Config Property SSv3MCM  Auto  

SSv3Handler Property Handler  Auto  
