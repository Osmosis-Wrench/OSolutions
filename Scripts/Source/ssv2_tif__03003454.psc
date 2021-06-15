;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname ssv2_tif__03003454 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SSv2.NPCSD = 1
SSv2q.SDRape = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;steal money from player
int goldLimit = SSv3MCM.op_goldTheftLimit As Int
if goldLimit > 0
	int goldStolen = Game.GetPlayer().GetGoldAmount()
	if goldStolen > goldLimit
		goldStolen = goldLimit
	EndIf
	Game.GetPlayer().RemoveItem(Gold001, goldStolen, false, akSpeaker)
EndIf

Handler.SexForTwo(akSpeaker, type="Aggressive", victim=0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



SSv2NPCScript Property SSv2  Auto  

SSv2QScript Property SSv2q  Auto  

MiscObject Property Gold001  Auto  

SSv3Config Property SSv3MCM  Auto  

SSv3Handler Property Handler  Auto  
