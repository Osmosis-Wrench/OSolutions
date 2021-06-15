;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv3_TIF__QuestsAssistJarlInit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If ( akSpeaker == SkaldTheElderREF || akSpeaker == BrinaMerilisREF )
	AssistJarlDawnstar.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == SiddgeirREF || akSpeaker == DengeirREF )
	AssistJarlFalkreath.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == IgmundREF || akSpeaker == ThongvorREF )
	AssistJarlMarkarth.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == IdgrodREF || akSpeaker == SorliREF )
	AssistJarlMorthal.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == LailaREF || akSpeaker == MavenREF )
	AssistJarlRiften.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == ElisifREF )
	AssistJarlSolitude.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == BalgruufREF || akSpeaker == VignarREF )
	AssistJarlWhiterun.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == UlfricREF || akSpeaker == BrunwulfREF )
	AssistJarlWindhelm.ForceRefTo(akSpeaker)
ElseIf ( akSpeaker == KorirREF || akSpeaker == KraldarREF )
	AssistJarlWinterhold.ForceRefTo(akSpeaker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AssistJarlDawnstar  Auto  
ReferenceAlias Property AssistJarlFalkreath  Auto  
ReferenceAlias Property AssistJarlMarkarth  Auto  
ReferenceAlias Property AssistJarlMorthal  Auto  
ReferenceAlias Property AssistJarlRiften  Auto  
ReferenceAlias Property AssistJarlSolitude  Auto  
ReferenceAlias Property AssistJarlWhiterun  Auto  
ReferenceAlias Property AssistJarlWindhelm  Auto  
ReferenceAlias Property AssistJarlWinterhold  Auto  

Actor Property SkaldTheElderREF  Auto  
Actor Property BrinaMerilisREF  Auto  
Actor Property SiddgeirREF  Auto  
Actor Property DengeirREF  Auto  
Actor Property IgmundREF  Auto  
Actor Property ThongvorREF  Auto  
Actor Property IdgrodREF  Auto  
Actor Property SorliREF  Auto  
Actor Property LailaREF  Auto  
Actor Property MavenREF  Auto  
Actor Property ElisifREF  Auto  
Actor Property BalgruufREF  Auto
Actor Property VignarREF  Auto  
Actor Property UlfricREF  Auto  
Actor Property BrunwulfREF  Auto  
Actor Property KorirREF  Auto  
Actor Property KraldarREF  Auto  
