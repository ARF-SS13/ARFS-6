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
