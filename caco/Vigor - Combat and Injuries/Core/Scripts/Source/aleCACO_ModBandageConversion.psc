Scriptname aleCACO_ModBandageConversion extends activemagiceffect  

Actor Property PlayerRef Auto
MiscObject Property CACOBandage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	if akTarget == PlayerRef
			PlayerRef.AddItem(CACOBandage, 1, true)
	endif
EndEvent