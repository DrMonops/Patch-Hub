Scriptname CACO_SunHelmCompatibility extends ReferenceAlias  

Actor Property PlayerRef Auto
Potion Property _SHWaterBottleWine Auto
Potion Property _SHWaterBottleMead Auto
Potion Property _SHSaltBottleWine Auto
Potion Property _SHSaltBottleMead Auto
Potion Property _SHSujammaWaterBottle Auto
Potion Property _SHSaltBottleSujamma Auto
Potion Property _SHWaterskin_1 Auto
Potion Property _SHWaterskin_2 Auto
Potion Property _SHWaterskin_3 Auto
Potion Property _SHWaterskinSalt Auto
MiscObject Property WaterToken Auto
MiscObject Property _SHEmptyMeadMisc Auto
MiscObject Property _SHEmptyWineMisc Auto
MiscObject Property _SHEmptySujammaMisc Auto
MiscObject Property _SHWaterskin_Empty Auto
Keyword Property CraftingCookpot Auto
Keyword Property BYOHCraftingOven Auto
Keyword Property UsesCookingSkill Auto
GlobalVariable property CACO_ConvertSaltWater Auto
GlobalVariable property MeadBottle_WaterTokens Auto
GlobalVariable property SujammaBottle_WaterTokens Auto
GlobalVariable property WaterSkin1_WaterTokens Auto
GlobalVariable property WaterSkin2_WaterTokens Auto
GlobalVariable property WaterSkin3_WaterTokens Auto
GlobalVariable property WaterSkinSalt_WaterTokens Auto
GlobalVariable property WineBottle_WaterTokens Auto

Event OnSit(ObjectReference akFurniture)
	if akFurniture.HasKeyWord(CraftingCookpot) || akFurniture.HasKeyWord(BYOHCraftingOven) || akFurniture.HasKeyWord(UsesCookingSkill)
		int WS1Count = PlayerRef.GetItemCount(_SHWaterskin_1)
		if WS1Count >= 1
			int WS1_Tokens = WaterSkin1_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, WS1Count*WS1_Tokens, true)
			PlayerRef.AddItem(_SHWaterskin_Empty, WS1Count, true)
			PlayerRef.RemoveItem(_SHWaterskin_1, WS1Count, true)
		endIf
		int WS2Count = PlayerRef.GetItemCount(_SHWaterskin_2)	
		if WS2Count >= 1
			int WS2_Tokens = WaterSkin2_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, WS2Count*WS2_Tokens, true)
			PlayerRef.AddItem(_SHWaterskin_Empty, WS2Count, true)
			PlayerRef.RemoveItem(_SHWaterskin_2, WS2Count, true)
		endIf
		int WS3Count = PlayerRef.GetItemCount(_SHWaterskin_3)	
		if WS3Count >= 1
			int WS3_Tokens = WaterSkin3_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, WS3Count*WS3_Tokens, true)
			PlayerRef.AddItem(_SHWaterskin_Empty, WS3Count, true)
			PlayerRef.RemoveItem(_SHWaterskin_3, WS3Count, true)
		endIf
		int MBCount = PlayerRef.GetItemCount(_SHWaterBottleMead)
		if MBCount >= 1
			int MB_Tokens = MeadBottle_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, MBCount*MB_Tokens, true)
			PlayerRef.AddItem(_SHEmptyMeadMisc, MBCount, true)
			PlayerRef.RemoveItem(_SHWaterBottleMead, MBCount, true)
		endIf
		int SBCount = PlayerRef.GetItemCount(_SHSujammaWaterBottle)
		if SBCount >= 1
			int SB_Tokens = SujammaBottle_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, SBCount*SB_Tokens, true)
			PlayerRef.AddItem(_SHEmptySujammaMisc, SBCount, true)
			PlayerRef.RemoveItem(_SHSujammaWaterBottle, SBCount, true)
		endIf
		int WBCount = PlayerRef.GetItemCount(_SHWaterBottleWine)
		if WBCount >= 1
			int WB_Tokens = WineBottle_WaterTokens.GetValueInt()
			PlayerRef.AddItem(WaterToken, WBCount*WB_Tokens, true)
			PlayerRef.AddItem(_SHEmptyWineMisc, WBCount, true)
			PlayerRef.RemoveItem(_SHWaterBottleWine, WBCount, true)
		endIf
			
		if CACO_ConvertSaltWater.GetValueInt() >= 1
			int WSSaltCount = PlayerRef.GetItemCount(_SHWaterskinSalt)
			if WSSaltCount >= 1
				int WSS_Tokens = WaterSkinSalt_WaterTokens.GetValueInt()
				PlayerRef.AddItem(WaterToken, WSSaltCount*WSS_Tokens, true)
				PlayerRef.AddItem(_SHWaterskin_Empty, WSSaltCount, true)
				PlayerRef.RemoveItem(_SHWaterskinSalt, WSSaltCount, true)
			endIf
			int MBSaltCount = PlayerRef.GetItemCount(_SHSaltBottleMead)
			if MBSaltCount >= 1
				int MB_Tokens = MeadBottle_WaterTokens.GetValueInt()
				PlayerRef.AddItem(WaterToken, MBSaltCount*MB_Tokens, true)
				PlayerRef.AddItem(_SHEmptyMeadMisc, MBSaltCount, true)
				PlayerRef.RemoveItem(_SHSaltBottleMead, MBSaltCount, true)
			endIf	
			int SBSaltCount = PlayerRef.GetItemCount(_SHSaltBottleSujamma)
			if SBSaltCount >= 1
				int SB_Tokens = SujammaBottle_WaterTokens.GetValueInt()
				PlayerRef.AddItem(WaterToken, SBSaltCount*SB_Tokens, true)
				PlayerRef.AddItem(_SHEmptySujammaMisc, SBSaltCount, true)
				PlayerRef.RemoveItem(_SHSaltBottleSujamma, SBSaltCount, true)
			endIf	
			int WBSaltCount = PlayerRef.GetItemCount(_SHSaltBottleWine)
			if WBSaltCount >= 1
				int WB_Tokens = WineBottle_WaterTokens.GetValueInt()
				PlayerRef.AddItem(WaterToken, WBSaltCount*WB_Tokens, true)
				PlayerRef.AddItem(_SHEmptyWineMisc, WBSaltCount, true)
				PlayerRef.RemoveItem(_SHSaltBottleWine, WBSaltCount, true)
			endIf	
		endif
		
	endIf
EndEvent
