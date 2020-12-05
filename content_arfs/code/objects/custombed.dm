//Giant Beds
/obj/structure/bed/double/big
	icon_scale_x = 2
	icon_scale_y = 2

/obj/structure/bed/double/huge
	icon_scale_x = 3
	icon_scale_y = 3

/obj/structure/bed/double/big/New(var/newloc)
	..(newloc,"wood","cotton")
	update_transform()

/obj/structure/bed/double/huge/New(var/newloc)
	..(newloc,"wood","cotton")
	update_transform()

/obj/structure/bed/double/big/post_buckle_mob(mob/living/M as mob)
	if(M.buckled == src)
		M.pixel_y = 25
		M.old_y = 25
	else
		M.pixel_y = 0
		M.old_y = 0

/obj/structure/bed/double/huge/post_buckle_mob(mob/living/M as mob)
	if(M.buckled == src)
		M.pixel_y = 37
		M.old_y = 37
	else
		M.pixel_y = -5
		M.old_y = -5
