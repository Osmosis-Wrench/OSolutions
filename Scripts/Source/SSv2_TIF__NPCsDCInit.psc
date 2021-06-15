;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SSv2_TIF__NPCsDCInit Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Drunk1AnimatingAlias.ForceRefTo(Drunk1.GetActorRef())
Drunk2AnimatingAlias.ForceRefTo(Drunk2.GetActorRef())
Drunk3AnimatingAlias.ForceRefTo(Drunk3.GetActorRef())
Drunk1AnimatingAlias.GetActorRef().EvaluatePackage()
Drunk2AnimatingAlias.GetActorRef().EvaluatePackage()
Drunk3AnimatingAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Drunk1  Auto  

ReferenceAlias Property Drunk2  Auto  

ReferenceAlias Property Drunk3  Auto  

ReferenceAlias Property Drunk1AnimatingAlias  Auto  

ReferenceAlias Property Drunk2AnimatingAlias  Auto  

ReferenceAlias Property Drunk3AnimatingAlias  Auto  
