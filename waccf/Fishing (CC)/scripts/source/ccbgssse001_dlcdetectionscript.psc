;/ Decompiled by Champollion V1.0.1
Source   : ccBGSSSE001_DLCDetectionScript.psc
Modified : 2021-09-29 13:42:37
Compiled : 2021-09-29 13:50:34
User     : builds
Computer : RKVBGSBUILD08
/;
scriptName ccBGSSSE001_DLCDetectionScript extends ReferenceAlias

;-- Properties --------------------------------------
globalvariable property ccBGSSSE001_VersionCurrent auto
{Current version number.}
potion[] property rawFish auto
weapon property ccBGSSSE001_DraugrWarhammer auto
leveleditem property ccBGSSSE001_LItemFoodFishBucketFish25 auto
leveleditem property LItemDraugr02Weapon2H auto
message property ccBGSSSE001_HelpFishingLongXbox auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrantConjuration02 auto
actor property PlayerRef auto
book property ccBGSSSE001_LineAndLure auto
formlist property ccBGSSSE001_BYOHHouse1UpgradeList auto
armor property ccBGSSSE001_MudcrabAmuletUnenchanted auto
formlist property HelpManualPC auto
leveleditem property DeathItemMudCrab02 auto
potion property ccBGSSSE001_FoodTunaSalmonCooked auto
miscobject property BYOHHouseInteriorPart021WallShelvesx2_02 auto
formlist property ccBGSSSE001_BYOHHouse3UpgradeList auto
formlist property RiftenFisheryLockList auto
leveleditem property ccBGSSSE001_LItemFoodFishCarp25 auto
potion property ccBGSSSE001_FoodCuckooCatfishCooked auto
objectreference property BYOHHouse2HoldingChestRoom12 auto
leveleditem property DeathItemMudCrab03 auto
weapon property ccBGSSSE001_DraugrDaggerHoned auto
armor property ccBGSSSE001_ClothesFishingBoots auto
leveleditem property LItemClothesAll auto
armor property ccBGSSSE001_ClothesCollegeHoodVagrant auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrantConjuration01 auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrantConjuration04 auto
leveleditem property LItemBook0All auto
location property BYOHHouse2LocationInterior auto
leveleditem property LItemDraugr02Weapon1H auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrant auto
globalvariable property ccBGSSSE001_ShowedCatchPromptThisSession auto
formlist property BYOHHouseFishContainerList auto
leveleditem property DeathItemMudCrab01 auto
leveleditem property LItemFoodFishList auto
formlist property ccBGSSSE001_BYOHAllFishingSpecificUpgradeMiscItems auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrantConjuration05 auto
armor property ccBGSSSE001_ClothesCollegeBootsVagrant auto
weapon property ccBGSSSE001_DraugrMace auto
leveleditem property LItemFoodInnCommon10 auto
actorbase property ccBGSSSE001_Viriya auto
formlist property HelpManualXBox auto
actorbase property ccBGSSSE001_SwimsInDeepWaters auto
ingredient[] property hatcheryFishIngredient auto
armor property ccBGSSSE001_ClothesCollegeRobesVagrantConjuration03 auto
objectreference property BYOHHouse1HoldingChestRoom12 auto
globalvariable property ccBGSSSE001_VersionLastKnown auto
{The last known version number. Used to know which updates to run on game load.}
formlist property BYOHHouseBuildingRoom12MasterList auto
leveleditem property LItemClothesWork auto
formlist property ccBGSSSE001_BYOHHouse2UpgradeList auto
formlist property ccBGSSSE001_BYOHMiscObjectList auto
leveleditem property LItemFoodInnCommon auto
leveleditem property ccBGSSSE001_FishingMapsAll auto
objectreference property BYOHHouse3HoldingChestRoom12 auto
weapon property ccBGSSSE001_DraugrMaceHoned auto
leveleditem property LItemMiscVendorMiscItems75 auto
armor property ccBGSSSE001_ClothesFishingClothes auto
weapon property ccBGSSSE001_DraugrDagger auto
leveleditem property LootToolRandom05 auto
armor property ccBGSSSE001_ClothesFishingHat auto
potion[] property hatcheryFishFood auto
location property BYOHHouse1LocationInterior auto
leveleditem property LItemRobesConjuration auto
leveleditem property LItemBookClutter auto
location property BYOHHouse3LocationInterior auto
leveleditem property BYOHLItemKhajiitCaravans auto
potion property ccBGSSSE001_FoodCrabMeat auto
message property ccBGSSSE001_HelpFishingLong auto
potion property ccBGSSSE001_FoodBucketFishCooked auto
globalvariable property ccBGSSSE001_ShowedReelPromptThisSession auto
weapon property ccBGSSSE001_FishingRodImperialWeap auto
weapon property ccBGSSSE001_DraugrWarhammerHoned auto
miscobject property BYOHHouseInteriorPart185VampireCoffin01 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function CheckForVersionUpdates(Int aiLastKnownVersion)

	; Empty function
endFunction

function AddHelpArticles()

	if !HelpManualPC.HasForm(ccBGSSSE001_HelpFishingLong as form)
		HelpManualPC.AddForm(ccBGSSSE001_HelpFishingLong as form)
	endIf
	if !HelpManualXBox.HasForm(ccBGSSSE001_HelpFishingLongXbox as form)
		HelpManualXBox.AddForm(ccBGSSSE001_HelpFishingLongXbox as form)
	endIf
endFunction

function RunUpdates()

	debug.trace("FISHING: Checking for updates.", 0)
	self.CheckForVersionUpdates(ccBGSSSE001_VersionLastKnown.GetValueInt())
	ccBGSSSE001_VersionLastKnown.SetValueInt(ccBGSSSE001_VersionCurrent.GetValueInt())
endFunction

function OnInit()

	self.AddHelpArticles()
	self.RunSetupBaseGame()
	self.RunDetectDLC()
	self.RunUpdates()
endFunction

function RunDetectDLC()

	formlist survivalRawMeatList = game.GetFormFromFile(2224, "ccQDRSSE001-SurvivalMode.esl") as formlist
	if survivalRawMeatList
		Int i = 0
		while i < rawFish.length
			if !survivalRawMeatList.HasForm(rawFish[i] as form)
				survivalRawMeatList.AddForm(rawFish[i] as form)
			endIf
			i += 1
		endWhile
	endIf
endFunction

; Skipped compiler generated GotoState

function BuildBYOHObject(location akCurrentPlayerLocation, location akHouseLocationToBuild, form akObjectToBuild)

	if self.GetCellarHoldingChestForLocation(akHouseLocationToBuild).GetItemCount(akObjectToBuild) > 0 || akCurrentPlayerLocation == akHouseLocationToBuild && PlayerRef.GetItemCount(akObjectToBuild) > 0
		objectreference myObject = self.GetObjectForLocationAndItem(akHouseLocationToBuild, akObjectToBuild)
		if myObject.IsDisabled()
			debug.trace("Player has built " + myObject as String + " for location " + akHouseLocationToBuild as String + ", enabling.", 0)
			myObject.EnableNoWait(false)
		endIf
	endIf
endFunction

function RunSetupBaseGame()

	RiftenFisheryLockList.AddForm(ccBGSSSE001_SwimsInDeepWaters as form)
	RiftenFisheryLockList.AddForm(ccBGSSSE001_Viriya as form)
	LItemFoodFishList.AddForm(ccBGSSSE001_LItemFoodFishBucketFish25 as form, 1, 1)
	LItemFoodFishList.AddForm(ccBGSSSE001_LItemFoodFishCarp25 as form, 1, 1)
	DeathItemMudCrab01.AddForm(ccBGSSSE001_FoodCrabMeat as form, 1, 1)
	DeathItemMudCrab02.AddForm(ccBGSSSE001_FoodCrabMeat as form, 1, 1)
	DeathItemMudCrab03.AddForm(ccBGSSSE001_FoodCrabMeat as form, 1, 2)
	LItemFoodInnCommon.AddForm(ccBGSSSE001_FoodBucketFishCooked as form, 1, 1)
	LItemFoodInnCommon.AddForm(ccBGSSSE001_FoodTunaSalmonCooked as form, 1, 1)
	LItemFoodInnCommon.AddForm(ccBGSSSE001_FoodCuckooCatfishCooked as form, 1, 1)
	LItemFoodInnCommon10.AddForm(ccBGSSSE001_FoodBucketFishCooked as form, 1, 1)
	LItemFoodInnCommon10.AddForm(ccBGSSSE001_FoodTunaSalmonCooked as form, 1, 1)
	LItemFoodInnCommon10.AddForm(ccBGSSSE001_FoodCuckooCatfishCooked as form, 1, 1)
	LItemClothesWork.AddForm(ccBGSSSE001_ClothesFishingBoots as form, 1, 1)
	LItemClothesWork.AddForm(ccBGSSSE001_ClothesFishingClothes as form, 1, 1)
	LItemClothesWork.AddForm(ccBGSSSE001_ClothesFishingHat as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesFishingBoots as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesFishingClothes as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesFishingHat as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_MudcrabAmuletUnenchanted as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesCollegeBootsVagrant as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesCollegeHoodVagrant as form, 1, 1)
	LItemClothesAll.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrant as form, 1, 1)
	LItemRobesConjuration.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrantConjuration01 as form, 1, 1)
	LItemRobesConjuration.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrantConjuration02 as form, 10, 1)
	LItemRobesConjuration.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrantConjuration03 as form, 20, 1)
	LItemRobesConjuration.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrantConjuration04 as form, 30, 1)
	LItemRobesConjuration.AddForm(ccBGSSSE001_ClothesCollegeRobesVagrantConjuration05 as form, 40, 1)
	LootToolRandom05.AddForm(ccBGSSSE001_FishingRodImperialWeap as form, 1, 1)
	LItemMiscVendorMiscItems75.AddForm(ccBGSSSE001_FishingRodImperialWeap as form, 1, 1)
	BYOHLItemKhajiitCaravans.AddForm(ccBGSSSE001_FishingMapsAll as form, 1, 3)
	LItemBook0All.AddForm(ccBGSSSE001_LineAndLure as form, 1, 1)
	LItemBookClutter.AddForm(ccBGSSSE001_LineAndLure as form, 1, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMace as form, 1, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMace as form, 1, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMace as form, 1, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMace as form, 1, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 12, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 13, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 14, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 15, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 15, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 21, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 22, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 23, 1)
;	LItemDraugr02Weapon1H.AddForm(ccBGSSSE001_DraugrMaceHoned as form, 24, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammer as form, 1, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammer as form, 1, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammer as form, 1, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammer as form, 1, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 12, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 13, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 14, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 15, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 15, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 21, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 22, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 23, 1)
;	LItemDraugr02Weapon2H.AddForm(ccBGSSSE001_DraugrWarhammerHoned as form, 24, 1)
	Int upgradeListLength = ccBGSSSE001_BYOHAllFishingSpecificUpgradeMiscItems.GetSize()
	Int i = 0
	while i < upgradeListLength
		BYOHHouseBuildingRoom12MasterList.AddForm(ccBGSSSE001_BYOHAllFishingSpecificUpgradeMiscItems.GetAt(i))
		i += 1
	endWhile
	location playerLoc = PlayerRef.GetCurrentLocation()
	self.BuildBYOHObject(playerLoc, BYOHHouse1LocationInterior, BYOHHouseInteriorPart021WallShelvesx2_02 as form)
	self.BuildBYOHObject(playerLoc, BYOHHouse1LocationInterior, BYOHHouseInteriorPart185VampireCoffin01 as form)
	self.BuildBYOHObject(playerLoc, BYOHHouse2LocationInterior, BYOHHouseInteriorPart021WallShelvesx2_02 as form)
	self.BuildBYOHObject(playerLoc, BYOHHouse2LocationInterior, BYOHHouseInteriorPart185VampireCoffin01 as form)
	self.BuildBYOHObject(playerLoc, BYOHHouse3LocationInterior, BYOHHouseInteriorPart021WallShelvesx2_02 as form)
	self.BuildBYOHObject(playerLoc, BYOHHouse3LocationInterior, BYOHHouseInteriorPart185VampireCoffin01 as form)
	i = 0
	while i < hatcheryFishFood.length
		BYOHHouseFishContainerList.AddForm(hatcheryFishFood[i] as form)
		i += 1
	endWhile
	i = 0
	while i < hatcheryFishIngredient.length
		BYOHHouseFishContainerList.AddForm(hatcheryFishIngredient[i] as form)
		i += 1
	endWhile
endFunction

objectreference function GetObjectForLocationAndItem(location akLocation, form akObjectToBuild)

	Int idx = ccBGSSSE001_BYOHMiscObjectList.Find(akObjectToBuild)
	if akLocation == BYOHHouse1LocationInterior
		return ccBGSSSE001_BYOHHouse1UpgradeList.GetAt(idx) as objectreference
	elseIf akLocation == BYOHHouse2LocationInterior
		return ccBGSSSE001_BYOHHouse2UpgradeList.GetAt(idx) as objectreference
	elseIf akLocation == BYOHHouse3LocationInterior
		return ccBGSSSE001_BYOHHouse3UpgradeList.GetAt(idx) as objectreference
	else
		return none
	endIf
endFunction

function OnPlayerLoadGame()

	ccBGSSSE001_ShowedReelPromptThisSession.SetValueInt(0)
	ccBGSSSE001_ShowedCatchPromptThisSession.SetValueInt(0)
	self.RunDetectDLC()
	self.RunUpdates()
endFunction

; Skipped compiler generated GetState

objectreference function GetCellarHoldingChestForLocation(location akLocation)

	if akLocation == BYOHHouse1LocationInterior
		return BYOHHouse1HoldingChestRoom12
	elseIf BYOHHouse2LocationInterior
		return BYOHHouse2HoldingChestRoom12
	elseIf BYOHHouse3LocationInterior
		return BYOHHouse3HoldingChestRoom12
	else
		return none
	endIf
endFunction
