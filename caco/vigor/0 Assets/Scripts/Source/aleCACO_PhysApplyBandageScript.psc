Scriptname aleCACO_PhysApplyBandageScript extends ObjectReference  

Message Property ApplyBandageMSG Auto
Actor Property PlayerRef Auto
MiscObject Property ThisBandage Auto
Armor Property HeadBandage Auto
Armor Property TorsoBandage Auto
Armor Property ArmBandage Auto
Armor Property FootBandage Auto

Event OnEquipped(Actor akActor)
	if akActor == PlayerRef
		int applypos = ApplyBandageMSG.Show()
		if applypos == 0
			PlayerRef.RemoveItem(ThisBandage, 1, true)
			PlayerRef.AddItem(HeadBandage, 1, true)
			PlayerRef.EquipItem(HeadBandage)
		elseif applypos == 1
			PlayerRef.RemoveItem(ThisBandage, 1, true)
			PlayerRef.AddItem(TorsoBandage, 1, true)
			PlayerRef.EquipItem(TorsoBandage)
		elseif applypos == 2
			PlayerRef.RemoveItem(ThisBandage, 1, true)
			PlayerRef.AddItem(ArmBandage, 1, true)
			PlayerRef.EquipItem(ArmBandage)
		elseif applypos == 3
			PlayerRef.RemoveItem(ThisBandage, 1, true)
			PlayerRef.AddItem(FootBandage, 1, true)
			PlayerRef.EquipItem(FootBandage)
		else
			return
		endif
	endif
EndEvent