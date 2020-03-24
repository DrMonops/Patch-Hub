Scriptname aleCACO_ObsoleteMiscBandageScript extends ObjectReference  

Actor Property PlayerRef Auto
MiscObject Property aleCACO_PhysBandageCurative Auto
MiscObject Property CACO_PhysBandageClean Auto
Potion Property aleCurativeALL Auto

Event OnEquipped(Actor akActor)
	if akActor == PlayerRef
			PlayerRef.RemoveItem(aleCACO_PhysBandageCurative, 1, true)
			PlayerRef.AddItem(CACO_PhysBandageClean, 1, true)
			PlayerRef.AddItem(aleCurativeALL, 1, true)
	endif
EndEvent