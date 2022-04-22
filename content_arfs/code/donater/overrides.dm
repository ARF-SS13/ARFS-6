/mob/living/simple_mob/animal/passive/pokemon/leg/lugia/andy/init_vore()
	if(LAZYLEN(vore_organs))
		return TRUE

	var/obj/belly/B = new /obj/belly/lugia/maw(src)
	B.emote_lists[DM_HOLD] = list(
		"The lugia's breath continues to pant over you rhythmically, each exhale carrying a bone-shivering growl",
		"The thick, heavy tongue lifts, curling around you, cramming you tightly against it's teeth, to squeeze some flavor out of you.",
		"For a moment, you find yourself slipping underneath the tongue, into the plush silky space beneath. After a momentary squirm, the tongue scoops you back atop itself, twice as slimy as before.",
		"The vast tongue quivers, inching you up close to it's gaping gullet. The slick hatch squeezes on a limb of yours, giving it a plush, sloppy, inviting tug...",
		"Nestled atop the muscle, an array of deep, dull muffled glrrrgles echo up the beast's gullet, a gastric siren-song calling out for you.")
	vore_selected = B
	B = new /obj/belly/lugia/throat(src)
	B.emote_lists[DM_HOLD] = list(
		"Gggllrrrk! Another loud, squelching swallow rings out in your ears, dragging you a little deeper into the furnace-like humid heat of the lugia's body.",
		"Nestling in a still throat for a moment, you feel the walls quiver and undulate excitedly in tune with the beast's heartbeat.",
		"A particularly lengthy moment between swallows passes. Perhaps the beast has calmed? Perhaps you might be able to squir-Gggglllk. Squelch. Deeper into the abyss you slide. No escape, probably.",
		"The throat closes in tightly, utterly cocooning you with it's silken spongey embrace. Like this it holds, until you feel like you might pass out... eventually, it would shlllrrk agape and loosen up all around you once more, the beast not wanting to lose the wriggly sensation of live prey.",
		"Blrrbles and squelching pops from it's stomach echo out below you. Each swallow brings greater clarity to those digestive sounds, and stronger acidity to the muggy air around you, inching you closer to it's grasp. Not long now.")
	B = new /obj/belly/lugia/stomach(src)
	B.emote_lists[DM_DIGEST] = list(
		"The stomach walls spontaneously contract! Those wavey, fleshy walls binding your body in their embrace for the moment, slathering you with thick, caustic acids.",
		"You hear a soft rumbling as the lugia’s insides churn around your body, the well-used stomach walls shuddering with a growl as you melt down.",
		"The stomach squishes and squelches over your body, the growling and grumbling of those bowels kneading you into submission like a deafening orchestra. Gradually melting you down into something easier to manage",
		"As your body breaks down into this beasts lunch you feel the walls compress tighter and tighter every moment pressing a crushing weight on your form.",
		"The constant, rhythmic kneading and massaging starts to take its toll along with the muggy heat, making you feel weaker and weaker!",
		"The lugia happily wanders around while digesting its meal, almost like it is trying to show off the hanging gut you've given it.")
	B = new /obj/belly/lugia/stomach/heal(src)
	B.emote_lists[DM_HEAL] = list(
		"In tune with the beast's heartbeat, the walls heave and spread all around you. In, tight and close, and then outwards, spreading cobwebs of slime all around.",
		"The thick folds of flesh around you blrrrble and sqllrrch, as the flesh itself secretes more of this strange, pure, goopy liquid, clenching it among it's crevices to squeeze it all over you in a mess.",
		"Smooth, happy rumbles echo all around, the lugia seemingly deriving pleasure from the weight and motions you make within it's depths. The walls roll and churn endlessly, happy to hold on to you as long as you wish to stay.",
		"A soft swaying, like the waves of an ocean, squish you to one side, and then to the other. The lugia's gentle movements seem to sway you side to side, as if in a tight possessive hammock on it's underside.",
		"Nearby, a louder cacophany of gushing glrrrbles, deep dull squelches, and even deeper glrrns call out. This safe pocket of flesh seems to be up close and intimate with the lugia's normal, larger stomach, thus you rest safely spectating the sounds it makes.",
		"The rushing breathing of the beast continues at a slow pace, indicating the calm it has. Holding you like this seems quite enjoyable to them, the chamber's folds just as calm and lazy in their motions of squelching the slimy contents all over your form.")
	B = new /obj/belly/lugia/gut(src)
	B.emote_lists[DM_ABSORB] = list(
		"The intestinal walls spontaneously contract! Those wavey, fleshy walls binding your body in their embrace for the moment, slathering you with thick slime.",
		"You hear a soft rumbling as the lugia’s insides churn around your body, the well-used intestinal walls squishing as you are absorbed.",
		"The intestines squishes and squelches over your body, the growling and grumbling of those bowels kneading you into submission like a deafening orchestra. Gradually absorbing you into the large creature",
		"As your body absorbs you into the beast, you feel the walls compress tighter and tighter every moment pressing a crushing weight on your form.",
		"The constant, rhythmic kneading and massaging starts to take its toll along with the muggy heat, making you feel weaker and weaker!",
		"The lugia happily wanders around while absorbing its meal, almost like it is trying to show off the hanging gut you've given it.")

/mob/living/simple_mob/animal/passive/pokemon/leg/lugia/andy/Life()
	for(var/obj/belly/B in src.vore_organs)
		var/count = 0
		if(B.digest_mode == DM_DIGEST || B.digest_mode == DM_ABSORB)
			for(var/mob/living/carbon/human/P in B)
				count++
			if(count < 1)
				B.digest_mode = DM_HOLD
	..()

/obj/belly/lugia
	autotransferchance = 50
	autotransferwait = 150
	escapable = 1
	escapechance = 100
	escapetime = 30
	fancy_vore = 1
	contamination_color = "grey"
	contamination_flavor = "Wet"
	vore_verb = "slurp"
	//belly_fullscreen_color = "#711e1e"

/obj/belly/lugia/maw
	name = "Maw"
	desc = "Seizing it's opportunity, the lugia's jaws swoop in to scoop you up off of your feet, giving you a view down your body of the glistening, red interior. Vicious looking jaws hover above you like a guillotine, threatening to sink down into you, though such a thing never arrives. Seems it has a slower fate in store for you, as it guides your body along the bumpy mattress of it's tongue until the lowermost parts of your body press around the entrance of it's wide, quivering throat. The jaws snap shut, trapping you within, though thankfully clear of snagging your body between them. It's vast tongue coming to life, lifting to cram you against the insides of it's teeth and against the cathedral-roof ridges of it's palate - lathering you in hot, oily drool. It's panting, growled breaths gust from that wide, eye-catching hatch at the back, blasting you with murky breath and airborne spittle, presenting itself as a place to get up close and intimate with very, very soon...."
	escapechance = 100
	struggle_messages_inside = list(
		"You wriggle and wrestle for purchase against the tongue. It lifts, cocooning and squeezing you hard between itself and the palate.",
		"Reaching out, you try to pry at the beast's interlocked, mighty teeth. A zig-zag crack of light bleeds in to the maw for a moment, presenting you with your current, slimy state, before clicking shut once more.",
		"You try to wriggle to the very front of the jaws to keep safe from that abyssal gullet. It works for a while, before the tongue scoops you right up close to that slick hatch, presenting you with a view of those dark, undulating, sloppy depths.",
		"You brace your back against the spongey mattress of the tongue, and plant your limbs up against the roof. Straining hard, you try to force the jaws agape. A dull growl increases, blasting you in humid murk and drool the more you strain, your efforts ultimately useless.",
		"Struggling for escape, you find yourself able to slip an arm between the beast's teeth and lips, reaching into the colder outside air. It doesn't take long for the beast's tongue to slither out with it, wrap over the limb, tugging it back inside with a noisy slllrrrp of it's lips.")
	autotransferlocation = "Throat"
	belly_fullscreen = "a_tumby"
	vore_sound = "Insertion1"

/obj/belly/lugia/throat
	name = "Throat"
	transferchance = 25
	transferlocation = "Maw"
	transferchance_secondary = 35
	transferlocation_secondary = "Second Stomach"
	escapechance = 0
	desc = "...And that 'very, very soon' rapidly becomes 'now'. The mighty tongue lifts, having collected enough of your flavor, squelching your lower body up to your chest inside it's hot gullet, giving you an ample view of itself slithering up over your body. You get to watch it quiver and clench with a resounding glllk, around you, the tongue's fat bumpy rear lifting behind your head to displace you down and inside the clinging tunnel. Tight, crushing pressure embraces you with each of those deep, liquid-sounding swallows, inching you down little by little each time. The flesh of the tunnel wraps you tightly, leaving you mostly unable to move, given short moments of respite between each swallow, to listen to the thudding heartbeat and the distant glrrrbles deep below. The hot scent of acidity grows stronger, the deeper you plunge..."
	struggle_messages_inside = list(
		"With as much effort as you can muster, you squirm and writhe, trying to swim up the passage of soft flesh. You barely peek out the beast's gullet, before the back of it's tongue squelches into your face, forcing you back down.",
		"You struggle and press outwards firmly against the walls. The beast rumbles out over you, shaking you to your bones. Was that a sound of pleasure from the lugia? Perhaps more of this struggling might appease it...",
		"Bracing your back against a wall, you try to press outwards with all the strength you have, to spread the throat agape. For a moment, it affords you a nice view down your body, towards the sealed muscular entryway to it's stomach. Everything clenches back shut around you shortly after.",
		"More squirming and struggling outwards, trying to hold the throat's muscular walls at bay. Every time you press outwards, the walls press back with twice the strength. Much more of this and it might threaten to crush. Perhaps you should just give in...",
		"You frantically writhe upwards a couple of inches, before the beast swallows with a sloppy-sounding glllggk, sending you back down a foot or so. Each struggle you make only seems to hasten your journey down the hatch. ")
	autotransferlocation = "Stomach"
	belly_fullscreen = "another_tumby"
	vore_sound = "Tauric Swallow"

/obj/belly/lugia/stomach
	name = "Stomach"
	escapechance = 0
	transferchance = 25
	transferlocation = "Throat"
	transferchance_secondary = 25
	transferlocation_secondary = "Gut"
	digestchance = 25
	desc = "The main part of your journey arrives. Throat pressure crams against you, until abruptly, you find yourself spat into a hot, caustic cauldron of churning doom, the lugia's stomach. After slithering in, the way you entered squelches shut, dissapearing among the folds - impossible for you to find any more. You are trapped, no way out, lounging in a shallow pool of thick sticky juices. Endless undulations from thick, pendulous folds of stomach-wall all around continually churn it up into a foamy, bubbling mess, soaking their folds in it to drip in ropes and even shivering sheets of the stuff around you. Clenches gush the digestive slimes all over you from time to time, cradling you in it's noxious embrace. Your ears are filled with such sloppy squelches now, those distant muffled glrrns you heard earlier now sharp, crisp, and thunderous as you nestle in their very source. Settle down for what little time you have left, for your fate rests adding to the powerful beast all around you."
	digest_mode = DM_HOLD
	mode_flags = 0x28
	digest_brute = 0.01
	digest_burn = 0.01
	struggle_messages_inside = list(
		"Eager to try and escape before you lack the strength to do so anymore, you pound firmly against those walls. They clench in twice as hard, the beast letting out a pleased rumble. Seems it wants you to do that again!",
		"You try to stand inside the clinging gut, to force your arms and head upwards towards the way you came in. Searching through each and every fold for the muscled entryway leaves you discovering nothing but caches of goop, soaking over you all the more.",
		"You press all your limbs out firmly into the walls to try and struggle. The softness of the flesh simply envelops over each of them, giving them a close kneading snuggle in hot oily goop.",
		"Each squirm and struggle you try to make just makes the beast rumble deeply in pleasure. It wriggles itself, sloshing and shaking you about, to try goad you into struggling all the more.",
		"Yet more frantic wriggling and squirming from you, pressing and thumping out into walls which themselves greedily devour all the effort you make into them. this deep inside, it doesn't appear to be helping.")
	belly_fullscreen = "da_tumby"
	vore_sound = "Tauric Swallow"

/obj/belly/lugia/stomach/heal
	name = "Second Stomach"
	desc = "You've kept yourself surrendered and let the beast get you this far, and now you find yourself squelching into the puffy, pillowy clutches of a rather tight chamber, spat slowly inside from the last portion of the gullet. It's pretty cramped in here, though the sheer squishiness of the walls allows you to stretch yourself out into them. Nothing but doughy texture for inches, even feet, deep into the walls. The chamber secretes a thick, clear slime all over you, the walls churning and lathering every single part of you lovingly in it's embrace. Its incessant, kneading affections seems reminiscent of the digestive processes, yet you feel no tingle from the liquid. To the contrary, any injuries or cuts you have, seem to buzz and heat up on touch with the liquids, closing up and healing over at a visibly rapid pace. This hidden space inside the beast seems to be dedicated to holding and healing things within it! The air, although humid and murky, is very breathable in here, though nearby - very close to you, is the constant squelch and churn of the standard processes of the lugia's digestive system. Seems you are right next door to a place you could of gone to! The path you entered remains visible among the undulating squelch of padded walls, and you feel that it wouldn't be too hard to writhe yourself back up into it's snug embrace."
	transferchance = 10
	transferchance_secondary = 0
	digestchance = 0
	digest_mode = DM_HEAL
	mode_flags = 0x29
	struggle_messages_inside = list("Deciding that you've stayed long enough, you wriggle and writhe, stretching yourself out in the chamber, trying to thrust your hands and face up the way you entered. The beast stirs, and this churny pocket of flesh providing you safety clenches hard, aiding your entry back up into the lowermost depths of it's gullet. rhythmic clenches continue to invite you back down, however, should you reconsider.")

/obj/belly/lugia/gut
	name = "Gut"
	escapechance = 0
	transferchance = 35
	transferlocation = "Stomach"
	digestchance = 10
	absorbchance = 20
	desc = "The final part of your journey arrives, in the form of a tightly squelched, muscular sphincter. Stomach pressure crams against you, until abruptly, you find yourself slid into a hot, wet slide of rippling flesh, the lugia's intestinal tract. After slithering in, the way you entered squelches shut, impossible for you to find any more. You are trapped, no way out, lounging in a thick tube of flesh. Endless undulations from thick, pendulous folds of intestine all around continually squish and ripple, soaking their folds in it to drip in ropes and even shivering sheets of the stuff around you. Clenches gush the slimes all over you from time to time, cradling you in it's embrace. Your ears are filled with such sloppy squelches now, those distant muffled glrrns you heard earlier now sharp, crisp, and thunderous as you nestle in their very source. Settle down for what little time you have left, for your fate rests adding to the powerful beast all around you."
	digest_mode = DM_HOLD
	digest_brute = 0.01
	digest_burn = 0.01
	struggle_messages_inside = list(
		"Eager to try and escape before you lack the strength to do so anymore, you pound firmly against those walls. They clench in twice as hard, the beast letting out a pleased rumble. Seems it wants you to do that again!",
		"You try to stand inside the clinging intestine, to force your arms and head upwards towards the way you came in. Searching through each and every fold for the muscled entryway leaves you discovering nothing, soaking over you all the more.",
		"You press all your limbs out firmly into the walls to try and struggle. The softness of the flesh simply envelops over each of them, giving them a close kneading snuggle in hot oily goop.",
		"Each squirm and struggle you try to make just makes the beast rumble deeply in pleasure. It wriggles itself, sloshing and shaking you about, to try goad you into struggling all the more.",
		"Yet more frantic wriggling and squirming from you, pressing and thumping out into walls which themselves greedily devour all the effort you make into them. This deep inside, it doesn't appear to be helping.")
	belly_fullscreen = "yet_another_tumby"
	vore_sound = "Stomach Move"