;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_Da13Intro_000BEDEC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kesh
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kesh Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if ( IsObjectiveDisplayed(0) == 1 )	;added by The Choice is Yours
   SetObjectiveCompleted(0, 1)
endif
Da13.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;setObjectiveDisplayed(0, 1)	;added by The Choice is Yours
;USKP 2.0.7 - Block this call, the scene already auto-starts with the quest.
;Da13IntroCompleteScene.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property da13  Auto  

scene Property Da13IntroCompleteScene  Auto  
