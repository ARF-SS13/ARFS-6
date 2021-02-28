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
		M.pixel_y = (25 + pixel_y)
		M.old_y = (25 + pixel_y)
		M.pixel_x = (pixel_x)
		M.old_x = (pixel_x)
	else
		M.pixel_y = 0
		M.old_y = 0
		M.pixel_x = 0
		M.old_x = 0

/obj/structure/bed/double/huge/post_buckle_mob(mob/living/M as mob)
	if(M.buckled == src)
		M.pixel_y = (37 + pixel_y)
		M.old_y = (37 + pixel_y)
		M.pixel_x = (pixel_x)
		M.old_x = (pixel_x)
	else
		M.pixel_y = -5
		M.old_y = -5
		M.pixel_x = 0
		M.old_x = 0
