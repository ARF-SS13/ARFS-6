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

#define MAP_LEVEL_VORESPAWN	0x100 // Z-levels players are allowed to late join to via vorish means. Usually non-dangerous locations.