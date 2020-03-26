Scriptname aleCACO_ObsoleteWornBandageScript extends ObjectReference  

Actor Property PlayerRef Auto
Armor Property ThisBandage Auto
MiscObject Property CACO_PhysBandageClean Auto
Potion Property aleCurativeALL Auto

Event OnEquipped(Actor akActor)
	if akActor == PlayerRef
			PlayerRef.RemoveItem(ThisBandage, 1, true)
			PlayerRef.AddItem(CACO_PhysBandageClean, 1, true)
			PlayerRef.AddItem(aleCurativeALL, 1, true)
	endif
EndEvent
