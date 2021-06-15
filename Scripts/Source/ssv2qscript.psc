Scriptname SSv2QScript extends Quest Conditional

; v3+ variables

Int Property ALovelyLetterRelationship = 0 Auto Conditional   ;0=None 1=Faendal 2=Sven 3=Camilla
Int Property DA14SceneState = 0 Auto Conditional   ;0=None 1=had sex 2=had reply
Int Property HasFuckedFjola = 0 Auto Conditional	


; v2 variables - some may be deprecated

;StandardVariables
Int Property NormalRape Auto Conditional ; 0 = Normal Sex, 1 = Rape
Int Property MultipleSex Auto Conditional ; Variable to separate between which sex scene.
Int Property SexType Auto Conditional ; 0 = Random, 1 = Anal, 2 = Oral, 3 = Vaginal
String Property SexPartner Auto Conditional ; Stores name of sexpartner

; Questvariables
Int Property GarveyFuck auto Conditional ; 1 = Anal, 2 = Oral, 3 = Vaginal
Int Property InnkeeperFuck auto Conditional ; 1 = Anal, 2 = Oral, 3 = Vaginal
Int Property AnskaFuck auto Conditional ; 1 = Anska is your sex-slave for the duration of the quest
Int Property GolldirFuck auto Conditional ; 1 = Golldir is your sex-slave for the duration of the quest
Int Property TGFuck auto Conditional ; 1 = a Thieves Guild member gets to fuck you.
Int Property TGBanFuck auto Conditional ; 10 = You have done your duty and lifted the ban
Int Property TGCumDump auto Conditional ; 1 = people will treat you like a cum-dump, no matter what your rank is.
Int Property DrahffGreet auto Conditional
Int Property GuardGreet auto Conditional
Int Property ElisifFuck auto Conditional ; Enables nightly sex with elisif.
int Property LisbetFuck Auto Conditional ; Enables alternative reward after Quest
int Property VerulusFuck Auto Conditional ; Stores whether player has convinced Verulus with sex in TheTasteOfDeath

; NPC Variables
Int Property DCFuck auto Conditional ; 1 = 3some, 2 = after 3some, 3 = 1vs1 1st, 4 = 1vs1 2nd, 5 = 1vs1 3rd
Int Property DirgeFuck auto Conditional ; 1 = Anal, 2 = Oral, 3 = Vaginal
Int Property EnthirFuck auto Conditional ; 1 = Anal, 2 = Oral, 3 = Vaginal, 4 = Allows further abuse, 5 = Allows whoring for Enthir
Int Property MerchantFuck auto Conditional ; 1 = Get Anal, 2 = Give Anal, 3 = Get Oral, 4 = Get Vaginal, 5 = Give Vaginal
Int Property StudentFuck auto Conditional ; 1 = Oral, 2 = random
Int Property EnthirStart auto Conditional ; 1 = you can have sex with Enthir to open vendor
Int Property SDRape auto Conditional ; 1= Skooma Dealer raped you
Int Property OrcSlut auto Conditional ; Number of times per day they can use you.
Int Property OrcGender auto Conditional ; What gender is allowed to use you 1 = Male, 2 = Female, 3 = Both
Int Property OrcDemand auto Conditional ;Set to 0 if the cooldown is expired and a new Orc can demand sex from player, and 1 otherwise.

