Scriptname SSv3FollowerTagEffect extends activemagiceffect  

ReferenceAlias Property SSv3ManualPlayerFollower  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SSv3ManualPlayerFollower.ForceRefTo(akTarget)
	Debug.Notification("Tagged " + akTarget.GetLeveledActorBase().GetName() + " as follower.")
EndEvent


