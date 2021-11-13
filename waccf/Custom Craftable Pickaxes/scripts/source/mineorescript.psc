scriptName MineOreScript extends objectReference
;
;This script handles the Ore Veins and handshakes with the mining furniture
;===================================================================


sound property DrScOreOpen auto
{sound played when Ore is acquired}

formlist property mineOreToolsList auto
{Optional: Player must have at least one item from this formlist to interact}

Message Property FailureMessage Auto  
{Message to say why you can't use this without RequiredWeapon}

Message Property DepletedMessage Auto  
{Message to say that this vein is depleted}

MiscObject Property Ore Auto  
{what you get from this Ore Vein}

LeveledItem property lItemGems10 auto
{Optional: Gems that may be mined along with ore}

int Property ResourceCount = 1 Auto
{how many resources you get per drop}

GlobalVariable Property ResourceCountGV_CCO auto						;added by Complete Crafting Overhaul by Kryptopyr
	
int property ResourceCountTotal = 3 auto
{how many resources this has before it is depleted}

GlobalVariable Property ResourceCountTotalGV_CCO auto					;added by Complete Crafting Overhaul by Kryptopyr
	
int property ResourceCountCurrent = -1 auto Hidden
{Used to track the current remaining resources}

int property StrikesBeforeCollection = 1 Auto
{how many times this is struck before giving a resource}

GlobalVariable Property StrikesBeforeCollectionGV_CCO auto				;added by Complete Crafting Overhaul by Kryptopyr

int property StrikesCurrent = -1 Auto hidden
{Current number of strikes}

int property AttackStrikesBeforeCollection = 3 Auto
{how many times this is struck by attacks before giving a resource}

GlobalVariable Property AttackStrikesBeforeCollectionGV_CCO auto		;added by Complete Crafting Overhaul by Kryptopyr

int property BYOHDeposit = 0 auto										;added by Complete Crafting Overhaul by Kryptopyr  Set this to 1 for Clay & Stone deposits found in Hearthfire DLC.
int property StalhrimDeposit = 0 auto									;added by Complete Crafting Overhaul by Kryptopyr  Set this to 1 for Stalhrim in order to double the number of strikes it takes to mine, and cap the max number of resources at 9.
int property DLC2MineGem = 0 auto										;added by Complete Crafting Overhaul by Kryptopyr  Set this to 1 for Gem Geodes found in Dragonborn DLC (can also be used for any ore where the max number of resources obtained should always be 1).
int property DLC1Shellbug = 0 auto										;added by Complete Crafting Overhaul by Kryptopyr  Set this to 1 for Shellbugs found in Dawnguard DLC (can also be used for any ore where the max number of resources obtained should always be 3).
int property SkillAdvance = 0 auto										;added by Complete Crafting Overhaul by Kryptopyr
int property MiningSkillIncrease = 0 auto								;added by Complete Crafting Overhaul by Kryptopyr
int RCint
;GlobalVariable Property MiningMakesNoise_CCO auto						;added by Complete Crafting Overhaul by Kryptopyr

int property AttackStrikesCurrent = -1 Auto hidden
{Current number of attack strikes}

mineOreFurnitureScript property myFurniture auto hidden
{the furniture for this piece of ore, set in script}

objectReference property objSelf auto hidden
{objectReference to self}

AchievementsScript property AchievementsQuest auto

Location Property CidhnaMineLocation Auto

Quest Property MS02 Auto

Quest Property DialogueCidhnaMine Auto

ObjectReference Property CidhnaMinePlayerBedREF Auto


;===================================================================
;;EVENT BLOCK
;===================================================================

event onCellAttach()
; 	debug.Trace(self + ": is running onCellAttach")
	blockActivation()
	SetNoFavorAllowed()
	objSelf = self as objectReference
	if !getLinkedRef()
; 		debug.Trace(self + ": does not have a linked ref, going to depleted state")
		depleteOreDueToFailure()
	endif
endEvent

event onActivate(objectReference akActivator)
; 	debug.Trace(self + " has been activated by " + akActivator)
	
	;Actor is attempting to mine
	if akActivator as actor
		;if the actor is the player
		if akActivator == game.getPlayer()
			;USKP 1.3.0 FixStart - Deactivate sneaking before mining to prevent sneak issues.
			if game.getPlayer().IsSneaking()
				game.getPlayer().StartSneaking()
			endif
			;USKP 1.3.0 FixEnd

			;if this is not depleted and the player has the right item
			If ResourceCountCurrent == 0
				DepletedMessage.Show()
			elseif playerHasTools() == false
				FailureMessage.Show()
			;enter the furniture
			else
				If Game.GetPlayer().GetCurrentLocation() == CidhnaMineLocation && MS02.ISRunning() == False
; 					debug.Trace(self + "Player is in Cidhna Mine, activate the bed to serve time")
					CidhnaMinePlayerBedREF.Activate(Game.GetPlayer())
					DialogueCidhnaMine.SetStage(45)
					Return
				EndIf
				
                Spell JL_MiningSpell = Game.GetFormFromFile(0x0421EA, "JLCraftablePickaxesUsingOres.esp") as Spell
                If JL_MiningSpell ;was the spell found?
                    game.getPlayer().AddSpell(JL_MiningSpell, false) ;add spell to actor mining. Equips pickaxe armor, and unequips after mining. 
                Else 
                    Debug.Notification("Error, JL_MiningSpell Not Found")
                Endif				
				
; 				debug.Trace(self + " should cause " + akActivator + " to activate " + getLinkedRef())
				if getLinkedRef()
					myFurniture = getLinkedRef() as mineOreFurnitureScript
					myFurniture.lastActivateRef = objSelf
					getLinkedRef().activate(akActivator)
					AchievementsQuest.incHardworker(2)
				Else
; 					debug.Trace(self + ": error this ore does not have a linkedRef")
				endif
			endif
		Else
			if getLinkedRef()
				getLinkedRef().activate(akActivator)
			Else
; 				debug.Trace(self + ": error this ore does not have a linkedRef")
			endif
		EndIf
		
	;Furniture is telling ore it has been struck	
	ElseIf akActivator == GetLinkedRef()
; 		debug.Trace(self + ": has been activated by" + akActivator)
		ProccessStrikes()
		
	;Something unexpected has activated the ore
	Else
; 		debug.Trace(self + "has been activated by: " + akActivator + " why?")
	endif
endEvent

;;;May add on hit with pickaxe here later
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	debug.Trace(self + ": onHit - akAgressor = " + akAggressor + "; akSource = " + akSource)
	if akAggressor == game.getPlayer()	
		;PATCH 1.5 CAPTURE ON HIT EVENT AND BRING UP SERVE TIME DIALOG FOR CIDHNA MINE
		if mineOreToolsList.hasForm(akSource)			
			If Game.GetPlayer().GetCurrentLocation() == CidhnaMineLocation && MS02.ISRunning() == False
; 				debug.Trace(self + "Player is in Cidhna Mine, activate the bed to serve time")
				CidhnaMinePlayerBedREF.Activate(Game.GetPlayer())
				DialogueCidhnaMine.SetStage(45)
			Return
			EndIf
			proccessAttackStrikes()
			if ((Game.GetFormFromFile(0x01CC0508, "Update.esm") As GlobalVariable).GetValue() As Int) == 1		;MiningMakesNoise_CCO	
				CreateDetectionEvent(Game.GetPlayer(), 250) 													;MINING MAKE NOISE by Kryptopyr	
			endif
		endif
	endif
endEvent

event onReset()
 ;	debug.Trace(self + ": is running onReset")
	;THIS WASN'T WORKING RIGHT
	self.Reset()
	self.clearDestruction()
	self.setDestroyed(False)
	; if getLinkedRef()
		resourceCountCurrent = -1
	; else
		; depleteOreDueToFailure()
	; endif
	;USKP 1.3.0 FixStart - if ore is enabled then disable and enable to avoid becoming un-mineable upon respawn.
	if self.isEnabled()
		self.disable()
		self.enable()
	endif
	;USKP 1.3.0 FixEnd
endEvent

;===================================================================
;;FUNCTION BLOCK
;===================================================================
bool function playerHasTools()
	if Game.GetPlayer().GetItemCount(mineOreToolsList) > 0
; 		debug.Trace(self + ": playerHasTools is returning true")
		return true
	Else
; 		debug.Trace(self + ": playerHasTools is returning false")
		return false
	endIf
endFunction

function proccessAttackStrikes()
	if AttackStrikesCurrent <= -1
		if StalhrimDeposit == 1																	 	;added by Complete Crafting Overhaul by kryptopyr
			AttackStrikesBeforeCollection = 2*((Game.GetFormFromFile(0x01CC0504, "Update.esm") As GlobalVariable).GetValue() As Int)	;AttackStrikesBeforeCollectionGV_CCO		
		else
			AttackStrikesBeforeCollection = ((Game.GetFormFromFile(0x01CC0504, "Update.esm") As GlobalVariable).GetValue() As Int)  	;AttackStrikesBeforeCollectionGV_CCO		
		endif																						;^^added by Complete Crafting Overhaul by kryptopyr
		AttackStrikesCurrent = AttackStrikesBeforeCollection
	EndIf
	AttackStrikesCurrent -= 1
	
	if AttackStrikesCurrent == 0
		AttackstrikesCurrent = AttackStrikesBeforeCollection
		giveOre()
	endIf
endFunction

function proccessStrikes()
	if StrikesCurrent <= -1
		if StalhrimDeposit == 1																	 	;added by Complete Crafting Overhaul by kryptopyr
			StrikesBeforeCollection = 2*((Game.GetFormFromFile(0x01CC0503, "Update.esm") As GlobalVariable).GetValue() As Int) 		;StrikesBeforeCollectionGV_CCO					
		else
			StrikesBeforeCollection = ((Game.GetFormFromFile(0x01CC0503, "Update.esm") As GlobalVariable).GetValue() As Int)		;StrikesBeforeCollectionGV_CCO					
		endif																						;^^added by Complete Crafting Overhaul by kryptopyr													
		StrikesCurrent = StrikesBeforeCollection
	EndIf
	StrikesCurrent -= 1
	
	if StrikesCurrent == 0
		strikesCurrent = StrikesBeforeCollection
		giveOre()
	endIf
	if ((Game.GetFormFromFile(0x01CC0508, "Update.esm") As GlobalVariable).GetValue() As Int) == 1		;MiningMakesNoise_CCO	
		CreateDetectionEvent(Game.GetPlayer(), 250) 													;MINING MAKE NOISE by Kryptopyr	
	endif
endFunction

function giveOre()
	if DLC2MineGem == 1																;added by Complete Crafting Overhaul by kryptopyr
		ResourceCountTotal = 1															
	elseif DLC1Shellbug == 1																
		ResourceCountTotal = 3	
	elseif BYOHDeposit == 1																
		ResourceCountTotal = 1000	
	else
		ResourceCountTotal = ((Game.GetFormFromFile(0x01CC0502, "Update.esm") As GlobalVariable).GetValue() As Int)  ;ResourceCountTotalGV_CCO	
		if (StalhrimDeposit == 1) && (ResourceCountTotal > 9)
			ResourceCountTotal = 9	
		endif
	endif																				;^^added by Complete Crafting Overhaul by kryptopyr
	if ResourceCountCurrent == -1
		ResourceCountCurrent = ResourceCountTotal
	EndIf
	
	if ResourceCountCurrent > 0
		MiningSkillIncrease = ((Game.GetFormFromFile(0x01CC0450, "Update.esm") As GlobalVariable).GetValue() As Int)	;added by Complete Crafting Overhaul by kryptopyr
		if MiningSkillIncrease > 0
			Game.AdvanceSkill("Smithing", MiningSkillIncrease)	
		endif
		if DLC2MineGem == 1 	;added by Complete Crafting Overhaul by kryptopyr (fixed by Rick for gem veins)
			ResourceCount = 1
		else
			ResourceCount = ((Game.GetFormFromFile(0x01CC0501, "Update.esm") As GlobalVariable).GetValue() As Int) ;ResourceCountGV_CCO 	
			if (ResourceCount > 3) && (DLC1Shellbug == 1)
				Resourcecount = 3
			elseif (ResourceCount > 9) && (StalhrimDeposit == 1)
				Resourcecount = 9	
			endif
		endif										
		if BYOHDeposit == 1
			ResourceCount = ResourceCount+3
		endif																			;^^added by Complete Crafting Overhaul by kryptopy
		if DLC1Shellbug == 1 || StalhrimDeposit == 1
			ResourceCountCurrent -= ResourceCount
			if ResourceCountCurrent < 0
				ResourceCountCurrent = 0
			endif	
		else
			ResourceCountCurrent -= 1
		endif	
; 		debug.Trace(self + ": ResourceCountCurrent = " + ResourceCountCurrent)
		if ResourceCountCurrent == 0
			
; 			debug.Trace(self + ": ResourceCountCurrent == 0 - depleted" )
			self.damageObject(50)
			getLinkedRef().activate(objSelf)
			DrScOreOpen.play(self)
			self.setDestroyed(true)
			; if this vein has ore and/or gems defined, give them.
			if ore
				(game.getPlayer()).addItem(Ore, ResourceCount)
				if lItemGems10
					game.getPlayer().addItem(lItemGems10)
				endif
			elseif lItemGems10 ; it is a geode vein (Rick)
				if ResourceCount == 1
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 3
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)				
				elseif ResourceCount == 6
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 2
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 4
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 5
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)				
				elseif ResourceCount == 7
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 8
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 9
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)			
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 10
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)			
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)							
				else
					game.getPlayer().addItem(lItemGems10, ResourceCount)
				endif
			endif
			DepletedMessage.Show()
		else
			DrScOreOpen.play(self)
			; if this vein has ore and/or gems defined, give them.
			if ore
				(game.getPlayer()).addItem(Ore, ResourceCount)
				if lItemGems10
					game.getPlayer().addItem(lItemGems10)
				endif
			elseif lItemGems10 ; it is a geode vein (Rick)
				if ResourceCount == 1
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 3
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)				
				elseif ResourceCount == 6
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 2
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 4
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
				elseif ResourceCount == 5
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)				
				elseif ResourceCount == 7
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 8
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 9
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)			
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				elseif ResourceCount == 10
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)
					(game.getPlayer()).addItem(lItemGems10)			
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
					(game.getPlayer()).addItem(lItemGems10)	
				else
					game.getPlayer().addItem(lItemGems10, ResourceCount)
				endif
			endif
		endif
	elseif ResourceCountCurrent == 0
		getLinkedRef().activate(objSelf)
		(getLinkedRef() as MineOreFurnitureScript).goToDepletedState()
		DepletedMessage.Show()
	endif

EndFunction

function depleteOreDueToFailure()
	self.damageObject(50)
	;THIS WASN'T WORKING RIGHT
	self.setDestroyed(true)
	ResourceCountCurrent = 0
endFunction


