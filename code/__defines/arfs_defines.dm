//These need to be high up so they're compiled before they're used

#define ispokemon(A)		istype(A, /mob/living/simple_mob/animal/passive/pokemon)
#define islegendary(A)		istype(A, /mob/living/simple_mob/animal/passive/pokemon/leg)

#define P_TYPE_FIRE 	"fire"
#define P_TYPE_WATER 	"water"
#define P_TYPE_ICE 		"ice"
#define P_TYPE_FLY 		"flying"
#define P_TYPE_PSYCH 	"psychic"
#define P_TYPE_NORM 	"normal"
#define P_TYPE_DARK 	"dark"
#define P_TYPE_FAIRY	"fairy"
#define P_TYPE_GRASS	"grass"
#define P_TYPE_DRAGON	"dragon"
#define P_TYPE_GROUND	"ground"
#define P_TYPE_ROCK		"rock"
#define P_TYPE_FIGHT	"fighting"
#define P_TYPE_GHOST	"ghost"
#define P_TYPE_STEEL	"steel"
#define P_TYPE_ELEC		"electric"
#define P_TYPE_POISON	"poison"
#define P_TYPE_BUG		"bug"

#define M_GHOSTED		"ghosted" //A ghost is using their phase move
#define M_SHOCK			"shocking" //Electric types shocking people who touch them
#define	M_TF			"transformed" //A ditto or something has transformed
#define M_INVIS			"invisible" //Mew can turn invisible, but not ethereal like M_GHOSTED

#define P_TRAIT_BLACKLIST	"blacklist" //Don't spawn this pokemon or show it in lists.
#define P_TRAIT_RIDEABLE	"rideable"  //This pokemon can be buckled to, ridden, and steered like a vehicle

#define MAP_LEVEL_VORESPAWN	0x100 // Z-levels players are allowed to late join to via vorish means. Usually non-dangerous locations.

#define X_SOUND_STEP 				list('content_arfs/sound/alien/effects/step1.ogg','content_arfs/sound/alien/effects/step2.ogg','content_arfs/sound/alien/effects/step3.ogg','content_arfs/sound/alien/effects/step4.ogg','content_arfs/sound/alien/effects/step5.ogg','content_arfs/sound/alien/effects/step6.ogg','content_arfs/sound/alien/effects/step7.ogg','content_arfs/sound/alien/effects/step8.ogg','content_arfs/sound/alien/effects/step9.ogg')
#define X_SOUND_STEP_VENT			list('content_arfs/sound/alien/effects/stepVent1.ogg','content_arfs/sound/alien/effects/stepVent2.ogg','content_arfs/sound/alien/effects/stepVent3.ogg','content_arfs/sound/alien/effects/stepVent4.ogg')
#define X_SOUND_BREATHE				list('content_arfs/sound/alien/voice/lowHiss1.ogg','content_arfs/sound/alien/voice/lowHiss2.ogg','content_arfs/sound/alien/voice/lowHiss3.ogg','content_arfs/sound/alien/voice/lowHiss4.ogg')
#define X_SOUND_STEP_WATER			list('content_arfs/sound/alien/effects/stepWater1.ogg','content_arfs/sound/alien/effects/stepWater2.ogg','content_arfs/sound/alien/effects/stepWater3.ogg','content_arfs/sound/alien/effects/stepWater4.ogg','content_arfs/sound/alien/effects/stepWater5.ogg','content_arfs/sound/alien/effects/stepWater6.ogg',)
#define X_SOUND_TALK				list('content_arfs/sound/alien/voice/talkNew1.ogg','content_arfs/sound/alien/voice/talkNew2.ogg','content_arfs/sound/alien/voice/talkNew3.ogg','content_arfs/sound/alien/voice/talkNew4.ogg','content_arfs/sound/alien/voice/talkNew5.ogg')
#define X_SOUND_RESINBUILD			list('content_arfs/sound/alien/effects/resin1.ogg','content_arfs/sound/alien/effects/resin2.ogg','content_arfs/sound/alien/effects/resin3.ogg','content_arfs/sound/alien/effects/resin4.ogg')
#define X_SOUND_RESINHIT			list('content_arfs/sound/alien/effects/resinHit1.ogg','content_arfs/sound/alien/effects/resinHit2.ogg','content_arfs/sound/alien/effects/resinHit3.ogg')
#define X_SOUND_SLIDE				list('content_arfs/sound/alien/effects/slide1.ogg','content_arfs/sound/alien/effects/slide2.ogg','content_arfs/sound/alien/effects/slide3.ogg','content_arfs/sound/alien/effects/slide4.ogg')
#define X_SOUND_STEP_HUGGER			list('content_arfs/sound/alien/effects/stepHugger1.ogg','content_arfs/sound/alien/effects/stepHugger2.ogg','content_arfs/sound/alien/effects/stepHugger3.ogg','content_arfs/sound/alien/effects/stepHugger4.ogg','content_arfs/sound/alien/effects/stepHugger5.ogg')
#define X_SOUND_SPIT				list('content_arfs/sound/alien/effects/spit1.ogg')
#define X_SOUND_TALK_HUGGER			list('content_arfs/sound/alien/voice/talkHugger1.ogg')
#define X_SOUND_GROWL				list('content_arfs/sound/alien/voice/growl1.ogg','content_arfs/sound/alien/voice/growl2.ogg','content_arfs/sound/alien/voice/growl3.ogg','content_arfs/sound/alien/voice/growl4.ogg','content_arfs/sound/alien/voice/growl5.ogg','content_arfs/sound/alien/voice/growl6.ogg','content_arfs/sound/alien/voice/growl7.ogg','content_arfs/sound/alien/voice/growl8.ogg','content_arfs/sound/alien/voice/growl9.ogg','content_arfs/sound/alien/voice/growl10.ogg')
#define X_SOUND_GNARL				list('content_arfs/sound/alien/voice/gnarl1.ogg','content_arfs/sound/alien/voice/gnarl2.ogg','content_arfs/sound/alien/voice/gnarl3.ogg')
#define X_SOUND_HISS				list('content_arfs/sound/alien/voice/hiss1.ogg','content_arfs/sound/alien/voice/hiss2.ogg','content_arfs/sound/alien/voice/hiss3.ogg','content_arfs/sound/alien/voice/hiss4.ogg','content_arfs/sound/alien/voice/hiss5.ogg')
#define X_SOUND_SCREECH				list('content_arfs/sound/alien/voice/screech1.ogg','content_arfs/sound/alien/voice/screech2.ogg','content_arfs/sound/alien/voice/screech3.ogg','content_arfs/sound/alien/voice/screech4.ogg')
#define X_SOUND_DEATH				list('sound/voice/hiss6.ogg')
#define X_SOUND_DEATH_HUGGER		list('content_arfs/sound/alien/voice/deathHugger.ogg')
#define X_SOUND_DEATH_LARVA			list('content_arfs/sound/alien/voice/deathHugger.ogg')
#define X_SOUND_ATTACK_CLAW			list('sound/weapons/rapidslice.ogg')
#define X_SOUND_WEED_GROW			list('content_arfs/sound/alien/effects/weeds1.ogg','content_arfs/sound/alien/effects/weeds2.ogg')
