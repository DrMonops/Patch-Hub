scriptName ccBGSSSE025_HarvestableActivator extends ObjectReference

;-- Properties --------------------------------------
Bool property useRareCuriosItem = false auto
message property harvestFailedMsg auto
sound property HarvestSound auto
leveleditem property leveledRareCuriosItem auto
actor property PlayerRef auto
leveleditem property itemToHarvest auto
globalvariable property isRareCuriosLoaded auto

;-- Variables ---------------------------------------
Bool needsReset = false

;-- Functions ---------------------------------------

function OnUpdate()

	self.GotoState("Ready")
	self.PlayAnimation("Reset")
	needsReset = false
endFunction

; Skipped compiler generated GetState

function OnReset()

	if self.Is3DLoaded()
		self.RegisterForSingleUpdate(2 as Float)
	else
		needsReset = true
	endIf
endFunction

; Skipped compiler generated GotoState

;-- State -------------------------------------------
auto state Ready

	function OnActivate(ObjectReference akActivator)

		if akActivator == PlayerRef as ObjectReference
			self.GotoState("harvested")
			if useRareCuriosItem as Bool && isRareCuriosLoaded.GetValueInt() == 1
				PlayerRef.AddItem(leveledRareCuriosItem as form, 1, false)
			else
				PlayerRef.AddItem(itemToHarvest as form, 1, false)
			endIf
			HarvestSound.Play(self as ObjectReference)
			self.PlayAnimation("Harvest")
		endIf
	endFunction
endState

;-- State -------------------------------------------
state harvested

	function OnActivate(ObjectReference akActivator)

		harvestFailedMsg.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	endFunction
endState
