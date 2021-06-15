;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv3R_TIF_Favor019ViolaSex Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Handler.SexForTwo(akSpeaker, context="pleasuring", type="Any")
Favor019.SetStage(15)
Handler.PlayerRef.RemoveItem(ViolasRing, 1)
akSpeaker.AddItem(ViolasRing, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SSv3Handler Property Handler  Auto
Quest Property Favor019 Auto  
Armor Property ViolasRing  Auto  
