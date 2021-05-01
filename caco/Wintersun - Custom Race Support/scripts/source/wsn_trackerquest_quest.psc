;/ Decompiled by Champollion V1.0.1
Source   : WSN_TrackerQuest_Quest.psc
Modified : 2019-02-23 13:40:34
Compiled : 2019-02-23 13:40:36
User     : Maximilian
Computer : MONETA
/;
scriptName WSN_TrackerQuest_Quest extends Quest

;-- Properties --------------------------------------
ingredient property HumanHeart auto
globalvariable property WSN_Effect_Global_BlockDecay auto
message property WSN_Help_Message_WorshipBasics_Clavicus auto
globalvariable property WSN_ModifyFavor_Shared_GainRateModifierCap auto
wsn_peryite_script property WSN_Peryite auto
message property WSN_Help_Message_WorshipBasics_Vaermina auto
keyword property VendorItemClothing auto
spell property WSN_Daedra_Jyggalag_Boon1_Spell_ProcOnSelf auto
Float property WSN_FavoredDiminishTarget auto
location property HighHrothgarLocation auto
quest[] property WSN_QuestToComplete auto
Int[] property WSN_DivineTypeID auto
magiceffect property MQpathToHHShrineEffect auto
globalvariable property WSN_ModifyFavor_Daedra_Vaermina_MeditationMult auto
faction property PlayerMarriedFaction auto
message property WSN_Help_Message_BecomeFavored auto
spell[] property WSN_Tenet auto
globalvariable property WSN_Favor_Global_Fractional2 auto
globalvariable property WSN_Effect_Global_MehrunesExplodesMax auto
Bool[] property WSN_QuestIsCompleted auto
globalvariable[] property WSN_StaticAttr_Multiplier auto
globalvariable property WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff auto
race[] property WSN_FavoredRace0 auto
message property WSN_Prayer_Message_Sithis_Fail auto
String property WSN_StringApostasy auto
Float[] property WSN_LastUsedFakeGameHours auto
{0 = meditation
1 = shrine blessing
2 = diminishing returns
3 = charity
4 = shouted
5 = thalmor kill
6 = shrine defiled}
globalvariable property WSN_Misc_Global_DrainMult auto
Float[] property WSN_PreviousFavor auto
globalvariable property WSN_Favor_Global auto
globalvariable property WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper auto
String property WSN_StringFavored auto
message property WSN_Help_Message_WorshipBasics_Yokudan auto
globalvariable property WSN_Effect_Global_MehrunesExplodes auto
globalvariable property WSN_Favor_Global_FractionalPig auto
message property WSN_Prayer_Message_Hircine_Fail auto
globalvariable[] property WSN_DynamicStat2_Multiplier auto
globalvariable property WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinAttribute auto
globalvariable property WSN_Misc_Global_MeditateMult auto
message property WSN_Help_Message_Apostasy auto
globalvariable[] property WSN_StaticStat2_Multiplier auto
message property WSN_Prayer_Message_TheMagnaGe_Fail auto
String[] property WSN_DeityName auto
String[] property WSN_DynamicStat0 auto
spell property WSN_Misc_TheHist_Boon1_Spell_ProcOnSelf auto
message property WSN_Prayer_Message_Peryite_Fail auto
String property WSN_AV auto
message property WSN_Prayer_Message_Julianos auto
globalvariable property WSN_ModifyFavor_Shared_DrainRateMult_1_Daedra_SheoOverride auto
String property WSN_NoDeity auto
globalvariable property WSN_ModifyFavor_Redguard_Morwha_FavorIfMarried auto
globalvariable property GameDaysPassed auto
message property WSN_Prayer_Message_Azura auto
magiceffect property WSN_Item_Hourglass_Effect_Ench auto
spell[] property WSN_Blessing auto
objectreference property WSN_Shrine auto
globalvariable[] property WSN_StaticSkills_Multiplier auto
globalvariable property WSN_Effect_Global_CurrentHermaThreshold auto
message property WSN_Prayer_Message_RiddleThar_Fail auto
message property WSN_Prayer_Message_TheHist_Fail auto
globalvariable property WSN_Effect_Global_RuptgaCounter auto
Float property WSN_HourglassMult auto
message property WSN_Prayer_Message_Nocturnal_Fail auto
globalvariable[] property WSN_StatBuffToGains_Multiplier auto
spell property WSN_Cure_Spell auto
globalvariable property WSN_FavorDrain_Global auto
message property WSN_Prayer_Message_Kynareth_Fail auto
magiceffect property WSN_Prayer_Effect_Sit_IsWerewolf auto
globalvariable property WSN_Effect_Global_HermaThresholdJump auto
String[] property WSN_StatBuffToGains auto
globalvariable property WSN_Favor_Global_Fractional auto
globalvariable property PlayerFollowerCount auto
Float[] property WSN_DrainRateMultIndividual auto
actor property PlayerRef auto
message property WSN_Prayer_Message_Dibella_Fail auto
globalvariable property WSN_Misc_Global_DisableAbandon auto
globalvariable property WSN_ModifyFavor_Shared_RedguardPrayerCap auto
globalvariable property WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState auto
globalvariable[] property WSN_StaticStat0_Multiplier auto
globalvariable[] property WSN_DynamicStat0_Multiplier auto
message property WSN_Misc_Message_DidNotMeditate auto
Float property WSN_UpdateRate auto
globalvariable property WSN_ModifyFavor_Divine_Mara_FavorIfMarried auto
globalvariable property WSN_Favor_Global_Fractional4 auto
String[] property WSN_StaticAttr auto
message property WSN_Prayer_Message_Azura_Fail auto
globalvariable property WSN_Favor_Global_FractionalHircine auto
globalvariable[] property WSN_PrayerRateMult auto
magiceffect property WSN_Prayer_Effect_Sit_IsInWilderness auto
Float property FavorChangeQueued auto
Bool property IsFavored = false auto
message property WSN_Help_Message_WorshipBasics auto
spell property WerewolfChange auto
Int property WorshipID = -1 auto
globalvariable property WSN_Misc_Global_FavorMod auto
magiceffect property WSN_Item_ElvenLamp_Effect_Ench auto
globalvariable property WSN_ModifyFavor_Shared_GainRateModifierDay auto
globalvariable property WSN_ModifyFavor_Shared_PrayerRateMult_1_Daedra_SheoOverride auto
message property WSN_Effects_Message_Herma_PerkPoint auto
globalvariable property WSN_ModifyFavor_Shared_PrayerGainFavorableWeather auto
potion property CACO_FoodMeatHumanoidFlesh auto
globalvariable property WSN_ModifyFavor_Divine_Mara_FavorIfHouseOwned auto
message[] property WSN_MehrunesMessage auto
globalvariable property WSN_Effect_Global_PeryiteBreathWeaponUsed auto
globalvariable property WSN_ModifyFavor_Divine_Akatosh_FavorPerLevelUp auto
globalvariable property WSN_Spell_Global_DivineType auto
String property WSN_StringFavored2 auto
message[] property WSN_FavorDisplay auto
String property WSN_StringUnfavored auto
message property WSN_Help_Message_BecomeUnfavored auto
globalvariable property GameHour auto
keyword property Vampire auto
globalvariable property WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinSkills auto
globalvariable property WSN_Favor_Global_Fractional3 auto
String[] property WSN_StaticStat1 auto
globalvariable property WSN_FavorFavoredRaceMult_Global auto
String[] property WSN_StaticStat0 auto
Float property WSN_ThresholdFavored auto
globalvariable property WSN_ModifyFavor_Misc_StAlessia_FavorIfHasFollower auto
magiceffect property WSN_Prayer_Effect_Sit_Diseased auto
globalvariable[] property WSN_DrainRateMult auto
message property WSN_Prayer_Message_Nocturnal auto
spell property WSN_Prayer_Spell auto
globalvariable[] property WSN_StaticStat1_Multiplier auto
spell[] property WSN_Boon2 auto
globalvariable property WSN_FavorMeditation_Global auto
Float property GameDayLastDecayed = -1.00000 auto
message property WSN_Prayer_Message_Mannimarco_Fail auto
String[] property WSN_StaticSkills auto
globalvariable[] property WSN_DynamicStat1_Multiplier auto
spell property WSN_Redguard_Ruptga_Boon1_Spell_ProcOnSelf auto
globalvariable property WSN_ModifyFavor_Shared_GainRateModifierBase auto
String[] property WSN_DynamicStat2 auto
String[] property WSN_DivineType auto
keyword property WSN_MagicBlessing_Keyword_Divine auto
Float[] property WSN_PrayerRateMultIndividual auto
spell[] property WSN_Boon1 auto
globalvariable[] property WSN_FavorBase_Global auto
explosion property WSN_Explosion auto
race[] property WSN_FavoredRace1 auto
String property WSN_StringUnfavored2 auto
globalvariable[] property WSN_Quest_Multiplier auto
globalvariable property WSN_FavorCurve_Global auto
message property WSN_Prayer_Message_TheMagnaGe auto
message property WSN_Prayer_Message_TheAllMaker_Fail auto
magiceffect property RestedMarriageSkillEffect auto
globalvariable property WSN_Effect_Global_DestinyActivated auto
String[] property WSN_StaticStat2 auto
keyword property VendorItemArmor auto
message property WSN_Prayer_Message_RiddleThar auto
String[] property WSN_DynamicStat1 auto

;-- Variables ---------------------------------------
Float DynamicStat2 = 0.000000
Bool ShowReminder = false
Float StartDay = 0.000000
Int StartSpellCount = 0
Float DynamicStat1 = 0.000000
Float DynamicStat0 = 0.000000
Int CharacterLevel = 0

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Pray()

	Float CurrentHPPct
	if WorshipID == 11
		CurrentHPPct = PlayerRef.GetActorValuePercentage("magicka")
	endIf
	Float FavorDelta = WSN_FavorMeditation_Global.GetValue() * utility.RandomFloat(0.500000, 1.50000)
	Bool PrayerFailed = false
	if WorshipID == 6
		Float CurrentGameHour = GameHour.GetValue()
		if CurrentGameHour < 4.00000 || CurrentGameHour >= 20.0000 || CurrentGameHour < 18.0000 && CurrentGameHour >= 6.00000
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Azura_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf weather.GetSkyMode() == 3
			if weather.GetCurrentWeather().GetClassification() == 0
				FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
				WSN_Prayer_Message_Azura.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			else
				FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
			endIf
		endIf
	elseIf WorshipID == 9
		if PlayerRef.WornHasKeyword(VendorItemArmor) || PlayerRef.WornHasKeyword(VendorItemClothing)
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Dibella_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 11
		if CurrentHPPct > 0.500000
			FavorDelta = 0 as Float
			WSN_MehrunesMessage[0].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf CurrentHPPct > 0.400000
			FavorDelta *= 0.250000
			WSN_MehrunesMessage[1].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
			WSN_Effect_Global_MehrunesExplodesMax.SetValue(10 as Float)
		elseIf CurrentHPPct > 0.300000
			FavorDelta *= 0.500000
			WSN_MehrunesMessage[2].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
			WSN_Effect_Global_MehrunesExplodesMax.SetValue(20 as Float)
		elseIf CurrentHPPct > 0.200000
			FavorDelta *= 0.750000
			WSN_MehrunesMessage[3].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
			WSN_Effect_Global_MehrunesExplodesMax.SetValue(30 as Float)
		else
			FavorDelta *= 1 as Float
			WSN_MehrunesMessage[4].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
			WSN_Effect_Global_MehrunesExplodesMax.SetValue(40 as Float)
		endIf
	elseIf WorshipID == 12
		if PlayerRef.GetSleepState() > 0
			FavorDelta *= WSN_ModifyFavor_Daedra_Vaermina_MeditationMult.GetValue()
		endIf
	elseIf WorshipID == 15
		Float currentgamehour = GameHour.GetValue()
		if currentgamehour >= 5.00000 && currentgamehour < 19.0000
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Nocturnal_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf PlayerRef.GetLightLevel() < 20 as Float
			FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
			WSN_Prayer_Message_Nocturnal.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf PlayerRef.GetLightLevel() < 40 as Float
			FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
		endIf
	elseIf WorshipID == 17
		if weather.GetSkyMode() != 3 && !PlayerRef.IsInLocation(HighHrothgarLocation)
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Kynareth_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 24
		WSN_Effect_Global_PeryiteBreathWeaponUsed.SetValue(0 as Float)
	elseIf WorshipID == 24
		if !PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_Diseased)
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Peryite_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 25
		if !PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_IsInWilderness)
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Hircine_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 27
		WSN_Effect_Global_DestinyActivated.SetValue(0 as Float)
	elseIf WorshipID == 29
		FavorDelta == 0 as Float
		PrayerFailed = true
	elseIf WorshipID == 34
		if PlayerRef.GetItemCount(CACO_FoodMeatHumanoidFlesh as form) > 0
			PlayerRef.RemoveItem(CACO_FoodMeatHumanoidFlesh as form, 1, false, none)
		elseIf PlayerRef.GetItemCount(HumanHeart as form) > 0
			PlayerRef.RemoveItem(HumanHeart as form, 1, false, none)
		else
			WSN_Prayer_Message_Sithis_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			FavorDelta = 0 as Float
			PrayerFailed = true
		endIf
	elseIf WorshipID == 44
		Float currentgamehour = GameHour.GetValue()
		if currentgamehour >= 5.00000 && currentgamehour < 19.0000
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_RiddleThar_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf weather.GetSkyMode() == 3
			if weather.GetCurrentWeather().GetClassification() == 0
				FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
				WSN_Prayer_Message_RiddleThar.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			elseIf weather.GetCurrentWeather().GetClassification() == 1
				FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
			endIf
		endIf
	elseIf WorshipID == 47
		if weather.GetSkyMode() != 3
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_TheHist_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 49
		Float currentgamehour = GameHour.GetValue()
		if currentgamehour >= 5.00000 && currentgamehour < 19.0000
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_Mannimarco_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 50
		if weather.GetSkyMode() != 3
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_TheAllMaker_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	elseIf WorshipID == 51
		Float currentgamehour = GameHour.GetValue()
		if currentgamehour >= 5.00000 && currentgamehour < 19.0000 || weather.GetSkyMode() != 3
			FavorDelta = 0 as Float
			PrayerFailed = true
			WSN_Prayer_Message_TheMagnaGe_Fail.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf weather.GetCurrentWeather().GetClassification() == 0
			FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeatherSuper.value
			WSN_Prayer_Message_TheMagnaGe.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf weather.GetCurrentWeather().GetClassification() == 1
			FavorDelta *= WSN_ModifyFavor_Shared_PrayerGainFavorableWeather.value
		endIf
	endIf
	FavorDelta *= WSN_PrayerRateMult[WSN_DivineTypeID[WorshipID]].GetValue() * WSN_PrayerRateMultIndividual[WorshipID]
	FavorDelta *= WSN_Misc_Global_MeditateMult.GetValue()
	if !PrayerFailed
		ShowReminder = false
		self.QueueDiminishingFavorChange(FavorDelta, true, 0, true)
	endIf
	WSN_Shrine.MoveTo(PlayerRef as objectreference, 0.000000, 0.000000, 0.000000, true)
endFunction

function CastBlessing()

	if WorshipID != -1
		WSN_Blessing[WorshipID].Cast(PlayerRef as objectreference, none)
	endIf
endFunction

Bool function EndWorship()

	Bool WasClavicus = false
	if WorshipID == 24
		WSN_Cure_Spell.Cast(PlayerRef as objectreference, none)
	elseIf WorshipID == 34
		PlayerRef.DispelSpell(WSN_Redguard_Ruptga_Boon1_Spell_ProcOnSelf)
		WSN_Effect_Global_RuptgaCounter.SetValue(0 as Float)
	elseIf WorshipID == 29
		WasClavicus = true
	elseIf WorshipID == 31
		PlayerRef.DispelSpell(WSN_Daedra_Jyggalag_Boon1_Spell_ProcOnSelf)
	elseIf WorshipID == 40
		WSN_Peryite.ClearTotem()
	elseIf WorshipID == 47
		PlayerRef.DispelSpell(WSN_Misc_TheHist_Boon1_Spell_ProcOnSelf)
	endIf
	if WorshipID != -1
		WSN_PreviousFavor[WorshipID] = WSN_Favor_Global.GetValue()
		Int ExWorshipID = WorshipID
		WorshipID = -1
		PlayerRef.RemoveSpell(WSN_Boon1[ExWorshipID])
		PlayerRef.RemoveSpell(WSN_Boon2[ExWorshipID])
		PlayerRef.RemoveSpell(WSN_Tenet[ExWorshipID])
		IsFavored = false
		DynamicStat0 = 0.000000
		DynamicStat1 = 0.000000
		DynamicStat2 = 0.000000
		FavorChangeQueued = 0.000000
		self.SetFavor(0 as Float)
		PlayerRef.DispelSpell(WSN_Prayer_Spell)
		PlayerRef.RemoveSpell(WSN_Prayer_Spell)
	endIf
	if WasClavicus == true
		WSN_Peryite.RemoveClavicus()
	endIf
	WSN_Spell_Global_DivineType.value = -1 as Float
	return true
endFunction

function QueueDiminishingFavorChange(Float akFavorChange, Bool abUpdateImmediately, Int aiLastUsedArrayID, Bool abShowStatusMessages)

	Float TimeSinceLast = GameDaysPassed.GetValue() - WSN_LastUsedFakeGameHours[aiLastUsedArrayID]
	if TimeSinceLast > 1.00000
		TimeSinceLast = 1.00000
	endIf
	WSN_LastUsedFakeGameHours[aiLastUsedArrayID] = GameDaysPassed.GetValue()
	self.QueueFavorChange(akFavorChange * TimeSinceLast, abUpdateImmediately, abShowStatusMessages)
endFunction

function OnUpdateGameTime()

	self.RegisterForSingleUpdateGameTime(WSN_UpdateRate * utility.RandomFloat(0.500000, 1.50000))
	if WorshipID != -1
		if WSN_Effect_Global_BlockDecay.GetValue() == 0 as Float
			Float FavorDelta = WSN_FavorDrain_Global.GetValue() * utility.RandomFloat(0.500000, 1.50000)
			FavorDelta *= WSN_DrainRateMult[WSN_DivineTypeID[WorshipID]].GetValue() * WSN_DrainRateMultIndividual[WorshipID]
			if WorshipID == 4
				if PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
				endIf
			elseIf WorshipID == 9
				if PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
				endIf
			elseIf WorshipID == 16
				if PlayerRef.HasKeyword(Vampire)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState.value
				endIf
			elseIf WorshipID == 17
				if PlayerRef.HasMagicEffect(MQpathToHHShrineEffect)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
				endIf
			elseIf WorshipID == 25
				if PlayerRef.HasSpell(WerewolfChange as form) || PlayerRef.HasMagicEffect(WSN_Prayer_Effect_Sit_IsWerewolf)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialState.value
				endIf
			elseIf WorshipID == 45
				if PlayerRef.HasMagicEffect(RestedMarriageSkillEffect)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
				endIf
			elseIf WorshipID == 48
				if PlayerRef.HasEffectKeyword(WSN_MagicBlessing_Keyword_Divine)
					FavorDelta *= WSN_ModifyFavor_Shared_DrainRateMult_DuringBeneficialBuff.value
				endIf
			endIf
			if WSN_DivineTypeID[WorshipID] == 1 && PlayerRef.HasMagicEffect(WSN_Item_Hourglass_Effect_Ench)
				FavorDelta *= WSN_HourglassMult
			endIf
			FavorDelta *= WSN_Misc_Global_DrainMult.GetValue()
			GameDayLastDecayed = GameDaysPassed.GetValue()
			self.QueueDiminishingFavorChange(FavorDelta, true, 2, false)
		endIf
		if WSN_LastUsedFakeGameHours[0] + 1.00000 < GameDaysPassed.GetValue() && ShowReminder == false
			WSN_Misc_Message_DidNotMeditate.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
			ShowReminder = true
		endIf
	endIf
endFunction

function ModFavor(Float akFavor)

	Float Favor = WSN_Favor_Global.GetValue() + akFavor
	self.SetFavor(Favor)
endFunction

function OnInit()

	self.RegisterForSingleUpdateGameTime(WSN_UpdateRate * utility.RandomFloat(0.500000, 1.50000))
endFunction

String function GetDeityName()

	if WorshipID == -1
		return WSN_NoDeity
	else
		return WSN_DeityName[WorshipID]
	endIf
endFunction

function SetFavor(Float akFavor)

	if WSN_DivineTypeID[WorshipID] == 2 && PlayerRef.HasMagicEffect(WSN_Item_ElvenLamp_Effect_Ench)
		akFavor *= 1.10000
	endIf
	WSN_Favor_Global.SetValue(akFavor)
	WSN_Favor_Global_Fractional.SetValue(akFavor * 0.100000)
	WSN_Favor_Global_Fractional2.SetValue(akFavor * 0.300000)
	WSN_Favor_Global_Fractional3.SetValue(akFavor * 0.200000)
	WSN_Favor_Global_Fractional4.SetValue(akFavor * 5.00000)
	WSN_Favor_Global_FractionalPig.SetValue(akFavor * 0.300000 / 100 as Float)
	WSN_Favor_Global_FractionalHircine.SetValue(akFavor * 0.200000 / 100 as Float)
	PlayerRef.ForceActorValue(WSN_AV, akFavor * 0.100000)
endFunction

function ProcessFavorChanges(Bool abShowStatusMessages)

	if WorshipID != -1
		Float Intermed1 = 0.000000
		Float Intermed2 = 0.000000
		Float Intermed3 = 0.000000
		Float Intermed4 = 0.000000
		Float Intermed5 = 0.000000
		Float Intermed6 = 0.000000
		Float Intermed7 = 0.000000
		Float Intermed8 = 0.000000
		Float NewFavor = 0.000000
		Float OldFavor = WSN_Favor_Global.GetValue()
		if WSN_StaticStat0_Multiplier[WorshipID]
			NewFavor += WSN_StaticStat0_Multiplier[WorshipID].GetValue() * game.QueryStat(WSN_StaticStat0[WorshipID]) as Float
		endIf
		if WSN_StaticStat1_Multiplier[WorshipID]
			NewFavor += WSN_StaticStat1_Multiplier[WorshipID].GetValue() * game.QueryStat(WSN_StaticStat1[WorshipID]) as Float
		endIf
		if WSN_StaticStat2_Multiplier[WorshipID]
			NewFavor += WSN_StaticStat2_Multiplier[WorshipID].GetValue() * game.QueryStat(WSN_StaticStat2[WorshipID]) as Float
		endIf
		if WSN_StaticAttr_Multiplier[WorshipID]
			if WSN_StaticAttr[WorshipID] == "health" || WSN_StaticAttr[WorshipID] == "magicka" || WSN_StaticAttr[WorshipID] == "stamina"
				NewFavor += WSN_StaticAttr_Multiplier[WorshipID].GetValue() * (PlayerRef.GetBaseActorValue(WSN_StaticAttr[WorshipID]) - 100.000)
			else
				NewFavor += WSN_StaticAttr_Multiplier[WorshipID].GetValue() * (PlayerRef.GetBaseActorValue(WSN_StaticAttr[WorshipID]) - 15.0000)
			endIf
		endIf
		if WSN_StaticSkills_Multiplier[WorshipID]
			if WSN_StaticSkills[WorshipID] == "Mage"
				NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetMage()
			elseIf WSN_StaticSkills[WorshipID] == "Thief"
				NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetThief()
			elseIf WSN_StaticSkills[WorshipID] == "Warrior"
				NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetWarrior()
			elseIf WSN_StaticSkills[WorshipID] == "total"
				NewFavor += WSN_StaticSkills_Multiplier[WorshipID].GetValue() * WSN_Peryite.GetTotal()
			endIf
		endIf
		Intermed1 = NewFavor
		if WorshipID == 4
			if PlayerRef.IsInFaction(PlayerMarriedFaction)
				NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfMarried.GetValue()
			endIf
			if game.QueryStat("Houses Owned") > 0
				NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfHouseOwned.GetValue()
			endIf
		elseIf WorshipID == 8
			NewFavor += PlayerRef.GetLevel() as Float * WSN_ModifyFavor_Divine_Akatosh_FavorPerLevelUp.GetValue()
		elseIf WorshipID == 44
			Float SkillsMult = WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinSkills.GetValue()
			Float AttrMult = WSN_ModifyFavor_Khajiit_RiddleThar_FavorFromMinAttribute.GetValue()
			Float Mage = SkillsMult * WSN_Peryite.GetMage()
			Float Thief = SkillsMult * WSN_Peryite.GetThief()
			Float Warrior = SkillsMult * WSN_Peryite.GetWarrior()
			if Mage > Thief
				if Mage > Warrior
					NewFavor += Mage
				else
					NewFavor += Warrior
				endIf
			elseIf Thief > Warrior
				NewFavor += Thief
			else
				NewFavor += Warrior
			endIf
			Mage = AttrMult * PlayerRef.GetBaseActorValue("magicka")
			Thief = AttrMult * PlayerRef.GetBaseActorValue("stamina")
			Warrior = AttrMult * PlayerRef.GetBaseActorValue("health")
			if Mage > Thief
				if Mage > Warrior
					NewFavor += Mage
				else
					NewFavor += Warrior
				endIf
			elseIf Thief > Warrior
				NewFavor += Thief
			else
				NewFavor += Warrior
			endIf
		elseIf WorshipID == 45
			if PlayerRef.IsInFaction(PlayerMarriedFaction)
				NewFavor += WSN_ModifyFavor_Misc_StAlessia_FavorIfHasFollower.GetValue()
			endIf
		elseIf WorshipID == 48
			if PlayerFollowerCount.GetValue() > 0 as Float
				NewFavor += WSN_ModifyFavor_Divine_Mara_FavorIfMarried.GetValue()
			endIf
		endIf
		Intermed2 = NewFavor
		if WSN_DynamicStat0[WorshipID]
			NewFavor += (game.QueryStat(WSN_DynamicStat0[WorshipID]) as Float - DynamicStat0) * WSN_DynamicStat0_Multiplier[WorshipID].GetValue()
		endIf
		if WSN_DynamicStat1[WorshipID]
			NewFavor += (game.QueryStat(WSN_DynamicStat1[WorshipID]) as Float - DynamicStat1) * WSN_DynamicStat1_Multiplier[WorshipID].GetValue()
		endIf
		if WSN_DynamicStat2[WorshipID]
			NewFavor += (game.QueryStat(WSN_DynamicStat2[WorshipID]) as Float - DynamicStat2) * WSN_DynamicStat2_Multiplier[WorshipID].GetValue()
		endIf
		Intermed3 = NewFavor
		NewFavor += FavorChangeQueued
		Intermed4 = NewFavor
		if WSN_QuestToComplete[WorshipID] as Bool && WSN_QuestToComplete[WorshipID].IsCompleted()
			WSN_QuestIsCompleted[WorshipID] = true
			NewFavor += WSN_Quest_Multiplier[WorshipID].GetValue()
		endIf
		Intermed5 = NewFavor
		Float DifferenceWithPrevious = NewFavor - OldFavor
		if DifferenceWithPrevious > 0.000000
			Float Diff1 = 0 as Float
			Float Diff2 = 0 as Float
			Float Diff3 = 0 as Float
			Float Diff4 = 0 as Float
			Float Diff5 = 0 as Float
			Float Diff6 = 0 as Float
			Float Diff7 = 0 as Float
			Float OldDifferenceWithPrevious = DifferenceWithPrevious
			Diff1 = DifferenceWithPrevious
			race PlayerRace = PlayerRef.GetRace()
			if WSN_FavoredRace0[WorshipID] as Bool && WSN_FavoredRace0[WorshipID] == PlayerRace || WSN_FavoredRace1[WorshipID] as Bool && WSN_FavoredRace1[WorshipID] == PlayerRace || WSN_FavoredRace0_Compat[WorshipID] as Bool && PlayerRace.HasKeyword(WSN_FavoredRace0_Compat[WorshipID])
				DifferenceWithPrevious *= WSN_FavorFavoredRaceMult_Global.GetValue()
			endIf
			Diff2 = DifferenceWithPrevious
			if WSN_StatBuffToGains_Multiplier[WorshipID]
				DifferenceWithPrevious *= (100.000 + WSN_StatBuffToGains_Multiplier[WorshipID].GetValue() * PlayerRef.GetBaseActorValue(WSN_StatBuffToGains[WorshipID])) / 100.000
			endIf
			Diff3 = DifferenceWithPrevious
			if OldFavor >= WSN_ThresholdFavored
				Float Range = WSN_FavoredDiminishTarget - WSN_ThresholdFavored
				if OldFavor >= WSN_ThresholdFavored + Range * 0.750000
					DifferenceWithPrevious *= 0.250000
				elseIf OldFavor >= WSN_ThresholdFavored + Range * 0.500000
					DifferenceWithPrevious *= 0.500000
				elseIf OldFavor >= WSN_ThresholdFavored + Range * 0.250000
					DifferenceWithPrevious *= 0.750000
				endIf
			endIf
			Diff4 = DifferenceWithPrevious
			if OldFavor + DifferenceWithPrevious > WSN_FavoredDiminishTarget
				DifferenceWithPrevious = WSN_FavoredDiminishTarget - OldFavor
			endIf
			Diff5 = DifferenceWithPrevious
			if WorshipID != 24 && WorshipID != 29
				Float ConvictionMultiplier = WSN_ModifyFavor_Shared_GainRateModifierBase.value + WSN_ModifyFavor_Shared_GainRateModifierDay.value * (GameDaysPassed.value - StartDay)
				if ConvictionMultiplier < WSN_ModifyFavor_Shared_GainRateModifierCap.value
					DifferenceWithPrevious *= ConvictionMultiplier
				else
					DifferenceWithPrevious *= WSN_ModifyFavor_Shared_GainRateModifierCap.value
				endIf
			endIf
			Diff6 = DifferenceWithPrevious
			NewFavor = OldFavor + DifferenceWithPrevious
			self.QueueFavorChange(-(OldDifferenceWithPrevious - DifferenceWithPrevious), false, false)
		endIf
		Intermed6 = NewFavor
		if WorshipID == 33
			NewFavor = utility.RandomFloat(-1.00000, 150.000)
		endIf
		NewFavor += WSN_Misc_Global_FavorMod.GetValue()
		self.SetFavor(NewFavor)
		if NewFavor <= 0 as Float
			if WSN_Misc_Global_DisableAbandon.GetValue() == 0 as Float
				debug.Notification(WSN_DeityName[WorshipID] + " " + WSN_StringApostasy)
				WSN_Help_Message_Apostasy.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
				self.EndWorship()
			else
				NewFavor = 0.000000
				self.SetFavor(NewFavor)
			endIf
		elseIf !IsFavored && NewFavor >= WSN_ThresholdFavored
			if abShowStatusMessages || WorshipID == 0
				debug.Notification(WSN_StringFavored + " " + WSN_DeityName[WorshipID] + " " + WSN_StringFavored2)
				PlayerRef.AddSpell(WSN_Boon2[WorshipID], true)
				PlayerRef.PlaceAtMe(WSN_Explosion as form, 1, false, false)
				IsFavored = true
				WSN_Help_Message_BecomeFavored.ShowAsHelpMessage("BecomeFavored", 6.00000, 9999 as Float, 1)
				self.QueueFavorChange(5.00000, false, false)
				self.SetFavor(NewFavor + 5.00000)
			endIf
		elseIf IsFavored as Bool && NewFavor < WSN_ThresholdFavored
			debug.Notification(WSN_StringUnfavored + " " + WSN_DeityName[WorshipID] + " " + WSN_StringUnfavored2)
			PlayerRef.RemoveSpell(WSN_Boon2[WorshipID])
			IsFavored = false
			WSN_Help_Message_BecomeUnfavored.ShowAsHelpMessage("BecomeUnfavored", 6.00000, 9999 as Float, 1)
		endIf
		if WorshipID == 0
			WSN_Prayer_Message_Julianos.Show(NewFavor, NewFavor - OldFavor, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		elseIf abShowStatusMessages
			WSN_FavorDisplay[WorshipID].Show(NewFavor, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		endIf
	endIf
	utility.Wait(2.00000)
	WSN_Effect_Global_BlockDecay.SetValue(0 as Float)
endFunction

function StartWorship(Int ID)

	if self.EndWorship()
		WorshipID = ID
		if WSN_DynamicStat0[WorshipID]
			DynamicStat0 = game.QueryStat(WSN_DynamicStat0[WorshipID]) as Float
		else
			DynamicStat0 = 0 as Float
		endIf
		if WSN_DynamicStat1[WorshipID]
			DynamicStat1 = game.QueryStat(WSN_DynamicStat1[WorshipID]) as Float
		else
			DynamicStat1 = 0 as Float
		endIf
		if WSN_DynamicStat2[WorshipID]
			DynamicStat2 = game.QueryStat(WSN_DynamicStat2[WorshipID]) as Float
		else
			DynamicStat2 = 0 as Float
		endIf
		FavorChangeQueued = 0.000000
		PlayerRef.AddSpell(WSN_Boon1[WorshipID], true)
		PlayerRef.AddSpell(WSN_Tenet[WorshipID], false)
		if WorshipID != 12
			PlayerRef.AddSpell(WSN_Prayer_Spell, true)
		endIf
		if WorshipID == 11
			WSN_Effect_Global_MehrunesExplodes.SetValue(0 as Float)
			WSN_Effect_Global_MehrunesExplodesMax.SetValue(40 as Float)
		elseIf WorshipID == 24
			WSN_Peryite.InitDiseases()
		elseIf WorshipID == 27
			WSN_Effect_Global_DestinyActivated.SetValue(0 as Float)
		elseIf WorshipID == 37
			WSN_Effect_Global_RuptgaCounter.SetValue(100 as Float)
		endIf
		if WorshipID == 12
			WSN_Help_Message_WorshipBasics_Vaermina.ShowAsHelpMessage("WorshipBasicsVaermina", 6.00000, 9999 as Float, 1)
		elseIf WorshipID == 29
			WSN_Help_Message_WorshipBasics_Clavicus.ShowAsHelpMessage("WorshipBasicsClavicus", 6.00000, 9999 as Float, 1)
		elseIf WorshipID == 36 || WorshipID == 37 || WorshipID == 38 || WorshipID == 45
			WSN_Help_Message_WorshipBasics_Yokudan.ShowAsHelpMessage("WorshipBasicsYokudan", 6.00000, 9999 as Float, 1)
		else
			WSN_Help_Message_WorshipBasics.ShowAsHelpMessage("WorshipBasics", 6.00000, 9999 as Float, 1)
		endIf
		GameDayLastDecayed = GameDaysPassed.GetValue()
		WSN_LastUsedFakeGameHours[0] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[1] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[2] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[3] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[4] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[5] = GameDayLastDecayed
		WSN_LastUsedFakeGameHours[6] = GameDayLastDecayed
		StartDay = GameDaysPassed.GetValue()
		Float StartingFavor = WSN_FavorBase_Global[WSN_DivineTypeID[WorshipID]].GetValue()
		if StartingFavor < WSN_PreviousFavor[WorshipID] && WSN_DivineTypeID[WorshipID] != 1
			StartingFavor = WSN_PreviousFavor[WorshipID]
			WSN_PreviousFavor[WorshipID] = 0.000000
		endIf
		self.QueueFavorChange(StartingFavor, true, true)
		WSN_Effect_Global_BlockDecay.SetValue(0 as Float)
		WSN_Spell_Global_DivineType.value = WSN_DivineTypeID[WorshipID] as Float
		WSN_Shrine.MoveTo(PlayerRef as objectreference, 0.000000, 0.000000, 0.000000, true)
	endIf
endFunction

function QueueFavorChange(Float akFavorChange, Bool abUpdateImmediately, Bool abShowStatusMessages)

	if WorshipID != -1
		FavorChangeQueued += akFavorChange
		if abUpdateImmediately == true
			self.ProcessFavorChanges(abShowStatusMessages)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

Keyword[] Property WSN_FavoredRace0_Compat  Auto  
