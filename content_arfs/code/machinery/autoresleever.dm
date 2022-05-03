/obj/machinery/transhuman/autoresleever/admin
    name = "Command Automatic Resleever"
    desc = "Uses advanced technology to detect when someone needs to be resleeved, and automatically prints and sleeves them into a new body. It even generates its own biomass! Seems to be intended for command personnel only."

/obj/machinery/transhuman/autoresleever/admin/attack_ghost(mob/observer/dead/user as mob)
    if(!is_admin(user))
        to_chat(user, "<span class='warning'>This autoresleever does not seem to work for non-command personnel.</span>")
        return
    ..()