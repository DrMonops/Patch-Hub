;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname PRKF_ORD_Alc30_AdvancedLab_P_0103D68B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If ORD_Alc_AdvancedLab_Global_Type.GetValue() > 0
	; has an upgraded table
	If (akTargetRef == ORD_Lab.GetRef() || akTargetRef == ORD_Lab_Small.GetRef()) || PlayerRef.HasPerk(ORD_Alc70_FieldAlchemy_Perk_70)
		; and it is this one
		If ORD_Alc_SneakDetector_Global_SneakFlag.GetValue() <= 0 || ORD_Alc_AdvancedLab_Message_Demolish.Show() == 0
			; and we are using it
			Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
			ORD_Alc_AdvancedLab_Spell_Proc.Cast(PlayerRef)
			; pass on activation to worktable
			;akTargetRef.Activate(PlayerRef)
			Game.EnablePlayerControls()
		Else
			; we want to break it
			ORD_AdvancedLab_Quest.Stop()
			ORD_Alc_AdvancedLab_Global_Type.SetValue(-1)
			ORD_Alc_AdvancedLab_Message_Demolished.Show()
			ORD_Alc_AdvancedLab_Marker_Upgrade.Play(akTargetRef)
		EndIf
	Else
		; pass on activation to worktable
		;akTargetRef.Activate(PlayerRef)
		Game.EnablePlayerControls()
	EndIf

Else
	; no upgraded workbench yet
	If PlayerRef.GetItemCount(Gold001) >= ORD_Gold && ORD_Alc_AdvancedLab_Message_Want.Show() == 1
		Game.DisablePlayerControls(true, true, false, false, true, true, true, false, 0)
		PlayerRef.RemoveItem(Gold001,ORD_Gold)
		ORD_Alc_AdvancedLab_Spell_Proc.Cast(PlayerRef)
		If (akTargetRef.GetBaseObject() == CraftingAlchemyWorkbenchTabletop)
			ORD_Alc_AdvancedLab_Global_Type.SetValue(2)
		Else
			ORD_Alc_AdvancedLab_Global_Type.SetValue(1)
		EndIf
		ORD_AdvancedLab_Quest.Start()
		ORD_Alc_AdvancedLab_Marker_Upgrade.Play(akTargetRef)
		ORD_Alc_AdvancedLab_Message_Upgraded.Show()
	EndIf
	; pass on activation to worktable
	;akTargetRef.Activate(PlayerRef)
	Game.EnablePlayerControls()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ORD_Alc_AdvancedLab_Global_Type  Auto  

ReferenceAlias Property ORD_Lab  Auto  

SPELL Property ORD_Alc_AdvancedLab_Spell_Proc  Auto  

Actor Property PlayerRef  Auto  

Message Property ORD_Alc_AdvancedLab_Message_Want  Auto  

Quest Property ORD_AdvancedLab_Quest  Auto  

Sound Property ORD_Alc_AdvancedLab_Marker_Upgrade  Auto  

Message Property ORD_Alc_AdvancedLab_Message_Upgraded  Auto  

Furniture Property CraftingAlchemyWorkbenchTabletop  Auto  

ReferenceAlias Property ORD_Lab_Small  Auto  

Perk Property ORD_Alc70_FieldAlchemy_Perk_70  Auto  

Message Property ORD_Alc_AdvancedLab_Message_Demolish  Auto  

MiscObject Property Gold001  Auto  

Int Property ORD_Gold  Auto  

Message Property ORD_Alc_AdvancedLab_Message_Demolished  Auto  

GlobalVariable Property ORD_Alc_SneakDetector_Global_SneakFlag  Auto  

ReferenceAlias Property ORD_Visuals  Auto  

ReferenceAlias Property ORD_LabUpgradesSmall  Auto  
